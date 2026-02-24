# Skill Swarms — Full Definitions (13 Swarms)

Swarms are predefined skill chains that activate together when a task matches a pattern. When ANY trigger matches, load ALL skills in that chain.

**Activation Rule:** Check swarm triggers BEFORE individual skill routing. Multiple swarms can activate simultaneously.

---

### SWARM 1: Document Factory
**Triggers:** "belge", "document", "rapor", "report", "sunum", "presentation", "excel", "tablo", "spreadsheet", "word", "pdf", "pptx", "dosya olustur"
**Chain:** `doc-coauthoring` → `docx`/`pdf`/`pptx`/`xlsx` → `theme-factory` → `brand-guidelines`
**Agent:** None | **Output:** Styled document in requested format

### SWARM 2: Security Fortress
**Triggers:** "guvenlik taramasi", "security audit", "zafiyet tara", "vulnerability scan", "kod guvenlik", "OWASP", "pentest", "guvenlik kontrol"
**Chain:** `tob-audit-context-building` → `tob-entry-point-analyzer` → `tob-static-analysis` → `tob-insecure-defaults` → `tob-sharp-edges` → `tob-variant-analysis` → `tob-semgrep-rule-creator`
**Agent:** `gg-cybersecurity.md` | **Output:** Security audit report

### SWARM 3: Design Studio
**Triggers:** "tasarla", "design", "UI yap", "arayuz", "mockup", "wireframe", "gorsel", "visual", "sayfayi tasarla", "component tasarla"
**Chain:** `brainstorming` → `design-lab` → `ui-ux-pro-max` → `frontend-design` → `canvas-design`
**Agents:** `gg-designer.md` + `gg-frontend.md` | **Output:** Finalized UI design

### SWARM 4: Full-Stack Builder
**Triggers:** "full-stack", "sayfa yap", "feature yap", "ozellik ekle", "endpoint + UI", "CRUD", "form yap"
**Chain:** `brainstorming` → `writing-plans` → `test-driven-development` → `frontend-design` → `vercel-react-best-practices` → `vercel-composition-patterns` → `systematic-debugging` → `verification-before-completion`
**Agents:** `gg-frontend.md` + `gg-backend.md` + `development/api-architect.md` + `quality/qa.md` | **Output:** Tested, production-ready feature

### SWARM 5: Data Visualization
**Triggers:** "grafik", "chart", "veri gorsellestir", "data viz", "visualization", "dashboard", "istatistik goster"
**Chain:** `d3js-visualization` → `xlsx` → `ui-ux-pro-max` → `canvas-design`
**Agent:** `gg-frontend.md` | **Output:** Interactive or static visualizations

### SWARM 6: Code Quality Gate
**Triggers:** "code review", "kod incele", "kalite kontrol", "merge oncesi", "PR review", "review yap"
**Chain:** `requesting-code-review` → `finding-duplicate-functions` → `tob-differential-review` → `tob-second-opinion` → `tob-spec-to-code-compliance` → `verification-before-completion`
**Agents:** `quality/qa.md` + `gg-cybersecurity.md` + `quality/performance-engineer.md` | **Output:** Comprehensive review

### SWARM 7: Content Machine
**Triggers:** "icerik yaz", "content", "blog yaz", "makale", "article", "newsletter", "dokumantasyon", "documentation"
**Chain:** `content-research-writer` → `doc-coauthoring` → `internal-comms` → `docx`/`pdf`
**Agent:** `creative/social-media-creator.md` (if social) | **Output:** Formatted content

### SWARM 8: Creative Lab
**Triggers:** "sanat", "art", "generative", "animasyon", "animation", "gif", "gorsel uret", "creative"
**Chain:** `brainstorming` → `algorithmic-art` → `canvas-design` → `slack-gif-creator` → `d3js-visualization`
**Agent:** `creative/motion-designer.md` | **Output:** Creative visual assets

### SWARM 9: Testing Fortress
**Triggers:** "test suite", "test yaz", "test kapsamini artir", "coverage", "e2e test", "integration test", "property test"
**Chain:** `test-driven-development` → `tob-property-based-testing` → `webapp-testing` → `systematic-debugging` → `verification-before-completion`
**Agent:** `quality/qa.md` | **Output:** Comprehensive test suite

### SWARM 10: Communication Hub
**Triggers:** "slack mesaj", "slack", "mesaj gonder", "takim iletisim", "team communication"
**Chain:** `slack-messaging` → `internal-comms` → `skill-share`
**Agent:** None | **Output:** Formatted team communications

### SWARM 11: Autonomous Builder (Ralph)
**Triggers:** "PRD yaz", "PRD olustur", "feature plan", "otonom gelistir", "ralph", "prd.json", "autonomous build", "hikaye yaz", "user story", "sprint plani"
**Chain:** `prd` → `ralph` → `writing-plans` → `test-driven-development` → `verification-before-completion`
**Agents:** `core/team-lead.md` + `core/delegation-coordinator.md` | **Output:** prd.json for Ralph loop
**Note:** After prd.json created, run `./ralph.sh --tool claude`

### SWARM 12: API Discovery & Integration
**Triggers:** "API bul", "API ara", "hangi API", "ucretsiz API", "free API", "API entegrasyon", "third-party API", "dis servis", "API onerisi"
**Chain:** `public-apis-reference` → `mcp-builder` → `writing-plans`
**Agents:** `development/api-architect.md` + `gg-backend.md` | **Output:** API recommendation + integration plan

### SWARM 13: Video Production Studio
**Triggers:** "video yap", "video uret", "remotion", "video edit", "video production", "animasyon video", "React video", "programmatic video", "video render", "video olustur"
**Chain:** `brainstorming` → `remotion` (37 rules) → `d3js-visualization` → `canvas-design` → `slack-gif-creator`
**Agents:** `creative/video-producer.md` + `creative/motion-designer.md` | **Output:** Programmatic video (Remotion)

---

### Composition Rules
1. **Swarms can stack** — Multiple swarms activate for complex tasks
2. **Order matters** — Execute skills in listed order
3. **AI Agents enhance** — Read agent .md files before executing chain
4. **Partial activation OK** — Activate only relevant skills if user needs subset
5. **GSD integration** — Swarms operate within GSD phases
6. **Parallel swarms** — Independent swarms run via Task subagents
7. **Output flows** — Swarm output feeds into GSD state (SUMMARY.md, STATE.md)
