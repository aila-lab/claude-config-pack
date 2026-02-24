#!/usr/bin/env node
// Context Monitor - PostToolUse hook
// Reads context metrics from the statusline bridge file and injects
// warnings when context usage is high. This makes the AGENT aware of
// context limits (the statusline only shows the user).
//
// How it works:
// 1. The statusline hook writes metrics to /tmp/claude-ctx-{session_id}.json
// 2. This hook reads those metrics after each tool use
// 3. When remaining context drops below thresholds, it injects a warning
//    as additionalContext, which the agent sees in its conversation
//
// Thresholds:
//   WARNING  (remaining <= 35%): Agent should wrap up current task
//   CRITICAL (remaining <= 25%): Agent should stop and save state
//   EMERGENCY (remaining <= 15%): Agent must force stop and handoff
//
// Debounce: Level-dependent (WARNING=5, CRITICAL=3, EMERGENCY=1)
// Severity escalation bypasses debounce

const fs = require('fs');
const os = require('os');
const path = require('path');

const WARNING_THRESHOLD = 35;    // remaining_percentage <= 35%
const CRITICAL_THRESHOLD = 25;   // remaining_percentage <= 25%
const EMERGENCY_THRESHOLD = 15;  // remaining_percentage <= 15%
const STALE_SECONDS = 60;        // ignore metrics older than 60s

const DEBOUNCE_WARNING = 5;      // min tool uses between WARNING messages
const DEBOUNCE_CRITICAL = 3;     // min tool uses between CRITICAL messages
const DEBOUNCE_EMERGENCY = 1;    // min tool uses between EMERGENCY messages

let input = '';
process.stdin.setEncoding('utf8');
process.stdin.on('data', chunk => input += chunk);
process.stdin.on('end', () => {
  try {
    const data = JSON.parse(input);
    const sessionId = data.session_id;

    if (!sessionId) {
      process.exit(0);
    }

    const tmpDir = os.tmpdir();
    const metricsPath = path.join(tmpDir, `claude-ctx-${sessionId}.json`);

    // If no metrics file, this is a subagent or fresh session -- exit silently
    if (!fs.existsSync(metricsPath)) {
      process.exit(0);
    }

    const metrics = JSON.parse(fs.readFileSync(metricsPath, 'utf8'));
    const now = Math.floor(Date.now() / 1000);

    // Ignore stale metrics
    if (metrics.timestamp && (now - metrics.timestamp) > STALE_SECONDS) {
      process.exit(0);
    }

    const remaining = metrics.remaining_percentage;
    const usedPct = metrics.used_pct;

    // No warning needed
    if (remaining > WARNING_THRESHOLD) {
      process.exit(0);
    }

    // Debounce: check if we warned recently
    const warnPath = path.join(tmpDir, `claude-ctx-${sessionId}-warned.json`);
    let warnData = { callsSinceWarn: 0, lastLevel: null };
    let firstWarn = true;

    if (fs.existsSync(warnPath)) {
      try {
        warnData = JSON.parse(fs.readFileSync(warnPath, 'utf8'));
        firstWarn = false;
      } catch (e) {
        // Corrupted file, reset
      }
    }

    warnData.callsSinceWarn = (warnData.callsSinceWarn || 0) + 1;

    // Determine severity level
    const isEmergency = remaining <= EMERGENCY_THRESHOLD;
    const isCritical = !isEmergency && remaining <= CRITICAL_THRESHOLD;
    const currentLevel = isEmergency ? 'emergency' : (isCritical ? 'critical' : 'warning');

    // Dynamic debounce based on severity
    const debounceLimit = isEmergency ? DEBOUNCE_EMERGENCY
      : isCritical ? DEBOUNCE_CRITICAL
      : DEBOUNCE_WARNING;

    // Emit immediately on first warning, then debounce subsequent ones
    // Severity escalation bypasses debounce (WARNING -> CRITICAL, CRITICAL -> EMERGENCY)
    const severityEscalated =
      (currentLevel === 'critical' && warnData.lastLevel === 'warning') ||
      (currentLevel === 'emergency' && warnData.lastLevel !== 'emergency');

    if (!firstWarn && warnData.callsSinceWarn < debounceLimit && !severityEscalated) {
      // Update counter and exit without warning
      fs.writeFileSync(warnPath, JSON.stringify(warnData));
      process.exit(0);
    }

    // Reset debounce counter
    warnData.callsSinceWarn = 0;
    warnData.lastLevel = currentLevel;
    fs.writeFileSync(warnPath, JSON.stringify(warnData));

    // Build warning message based on severity
    let message;
    if (isEmergency) {
      message = `CONTEXT MONITOR EMERGENCY: Usage at ${usedPct}%. Remaining: ${remaining}%. ` +
        'MANDATORY ACTIONS (do these NOW, nothing else): ' +
        '1. Output this message to the user: "CONTEXT LIMIT REACHED. Please start a new conversation. Run /gsd:resume-work to continue where we left off." ' +
        '2. Do NOT make any more tool calls after this response. ' +
        '3. Summarize in 2-3 sentences what was being worked on and what the next step should be.';
    } else if (isCritical) {
      message = `CONTEXT MONITOR CRITICAL: Usage at ${usedPct}%. Remaining: ${remaining}%. ` +
        'ACTION REQUIRED: ' +
        '1. STOP all new work immediately. ' +
        '2. If in a GSD project, run /gsd:pause-work to save execution state. ' +
        '3. Tell the user: "Context window is nearly full. I recommend starting a new conversation. Use /gsd:resume-work to continue exactly where we left off." ' +
        '4. If no GSD project, output a brief handoff summary of current work state.';
    } else {
      message = `CONTEXT MONITOR WARNING: Usage at ${usedPct}%. Remaining: ${remaining}%. ` +
        'ACTION REQUIRED: ' +
        '1. Do NOT start new complex tasks. ' +
        '2. Wrap up current task to a stable checkpoint. ' +
        '3. Consider running /compact to free context. ' +
        '4. If using GSD, prepare for /gsd:pause-work if needed.';
    }

    const output = {
      hookSpecificOutput: {
        hookEventName: "PostToolUse",
        additionalContext: message
      }
    };

    process.stdout.write(JSON.stringify(output));
  } catch (e) {
    // Silent fail -- never block tool execution
    process.exit(0);
  }
});
