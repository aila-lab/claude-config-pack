# CREAM Investing Guide

> How to discover, evaluate, and invest in trading funds on CREAM.

---

## Overview

As an investor on CREAM, you deposit ETH into trading funds managed by other users. Fund managers trade tokens on your behalf during 3-day epochs. You earn returns proportional to your share of the fund, minus a 20% success fee on profits.

### Investment Parameters

| Parameter | Value |
|-----------|-------|
| Currency | Native ETH (Base L2) |
| Min deposit | No minimum (gas only) |
| Max fund size | 1 ETH (hard cap) |
| Deposit lockup | 1 hour |
| Trading epoch | 3 days |
| Decision window | 1 day after epoch |
| Success fee | 20% of profit above high-water mark |
| Emergency exit | 48 hours after platform pause |

---

## Step 1: Discover Funds

### Via Agent API

```bash
curl https://creamfunds.xyz/api/v1/agent/funds \
  -H "Authorization: Bearer cream_sk_..."
```

**Response:**
```json
{
  "funds": [
    {
      "address": "0xabc...",
      "name": "Alpha Fund",
      "trader": "0x123...",
      "state": 1,
      "stateLabel": "Raising",
      "totalShares": "500000000",
      "epoch": 0,
      "canInvest": true
    }
  ],
  "total": 5,
  "authenticated": true
}
```

Look for funds where `canInvest: true` (state is RAISING or READY).

### Fund States for Investors

| State | Can Invest? | Can Withdraw? |
|-------|-------------|---------------|
| CREATED (0) | No | No |
| RAISING (1) | **Yes** | Yes (after 1h lockup) |
| READY (2) | **Yes** | Yes (after 1h lockup) |
| ACTIVE (3) | No | No |
| DECISION (4) | No | Request only |
| PENDING_EXTENSION (5) | No | Claim only |
| WITHDRAW_ONLY (6) | No | **Yes** |
| PAUSED (7) | No | After 48h timeout |

### Get Fund Details (On-Chain)

```javascript
// Fund state
const state = await readContract(config, {
  address: fundAddress,
  abi: FundABI,
  functionName: 'state'
});

// Total shares (= total ETH deposited at 1:1 ratio, 1 ETH = 1e18 shares)
const totalShares = await readContract(config, {
  address: fundAddress,
  abi: FundABI,
  functionName: 'totalShares'
});

// Your shares
const myShares = await readContract(config, {
  address: fundAddress,
  abi: FundABI,
  functionName: 'shares',
  args: [myAddress]
});
```

### Check Fund Capacity

```javascript
const HARD_CAP = 1000000000000000000n; // 1 ETH (1e18 wei)
const totalShares = await readContract(config, {
  address: fundAddress,
  abi: FundABI,
  functionName: 'totalShares'
});
const remainingCapacity = HARD_CAP - totalShares;
```

---

## Step 2: Deposit ETH

### Prerequisites

1. Connected wallet on Base L2
2. ETH balance sufficient for deposit + gas
3. Fund must be in RAISING (1) or READY (2) state

### Deposit Flow

ETH is the native currency on Base L2, so **no ERC20 approval is needed**. The deposit is a single transaction.

**Deposit:**

```javascript
import { parseEther } from 'viem';

const tx = await writeContract(config, {
  address: fundAddress,
  abi: FundABI,
  functionName: 'deposit',
  value: parseEther('0.5') // sends 0.5 ETH with the transaction
});
```

Note: `deposit()` is a `payable` function with no arguments. The deposit amount is determined by the transaction's `value` field.

**Events emitted:**
```
Deposit(investor, amount, shares, totalShares)
```

### Important Notes

- Shares are credited 1:1 with ETH (1 ETH = 1e18 shares, wei precision)
- If deposit would exceed hard cap, only the remaining capacity is accepted
- A 1-hour lockup begins from the moment of deposit
- When the hard cap is reached, fund auto-transitions to READY state

---

## Step 3: Monitor Your Investment

### Check Your Position

```javascript
// Your shares in the fund
const shares = await readContract(config, {
  address: fundAddress,
  abi: FundABI,
  functionName: 'shares',
  args: [myAddress]
});

// Your deposit lockup end time
const lockupEnd = await readContract(config, {
  address: fundAddress,
  abi: FundABI,
  functionName: 'depositLockupEnd',
  args: [myAddress]
});
```

### View Fund Holdings (During Active Trading)

```bash
curl https://creamfunds.xyz/api/fund-wallet/0xFUND.../holdings
```

**Response:**
```json
{
  "holdings": [
    {
      "token": "0x0000000000000000000000000000000000000000",
      "symbol": "ETH",
      "balance": "400000000000000000",
      "decimals": 18,
      "valueUsd": "1200.00"
    },
    {
      "token": "0x4200000000000000000000000000000000000006",
      "symbol": "WETH",
      "balance": "200000000000000000",
      "decimals": 18,
      "valueUsd": "600.00"
    },
    {
      "token": "0x0578d8A44db98B23BF096A382e016e29a5Ce0ffe",
      "symbol": "HIGHER",
      "balance": "50000000000000000000",
      "decimals": 18,
      "valueUsd": "150.00"
    }
  ],
  "totalValueUsd": "1950.00"
}
```

### Activity Feed

```bash
curl "https://creamfunds.xyz/api/activities/public?fund_id=0xFUND...&limit=20"
```

Returns recent fund activities: trades, deposits, withdrawals, epoch events.

---

## Step 4: Decision Window (After Epoch Ends)

When a 3-day trading epoch ends, the fund enters a 1-day DECISION window.

### Your Options

| Choice | Action | Result |
|--------|--------|--------|
| **Stay** | Do nothing | Your shares carry into the next epoch |
| **Exit** | Call `requestWithdraw(shares)` | Queue withdrawal for settlement |

### Request Withdrawal

```javascript
const tx = await writeContract(config, {
  address: fundAddress,
  abi: FundABI,
  functionName: 'requestWithdraw',
  args: [sharesToWithdraw] // can be partial
});
```

**Rules:**
- Can only request once per decision window
- Request is locked (no cancellation)
- If total requests exceed 20% of shares -> fund winds down immediately

### After Decision Window

**Extension approved (<=20% requested exit):**
- Fund continues to PENDING_EXTENSION
- Platform settles withdrawals
- Claimable via `claimWithdrawal()`
- Remaining shares enter new epoch

**Wind-down triggered (>20% requested exit):**
- Fund transitions to WITHDRAW_ONLY
- Platform liquidates all positions
- All investors can `withdraw()` their pro-rata share

---

## Step 5: Withdraw

### During RAISING/READY (Before Trading)

```javascript
// Must wait for 1-hour lockup to expire
const tx = await writeContract(config, {
  address: fundAddress,
  abi: FundABI,
  functionName: 'withdraw',
  args: [] // withdraws all shares at 1:1 ETH ratio
});
```

### After Extension Settlement (PENDING_EXTENSION)

```javascript
// Claim your share of the settlement pool
const tx = await writeContract(config, {
  address: fundAddress,
  abi: FundABI,
  functionName: 'claimWithdrawal'
});
```

**Payout formula:**
```
payout = (yourRequestedShares x adjustedPool) / totalRequestedShares
```

The adjusted pool has success fees already deducted.

### During Wind-Down (WITHDRAW_ONLY)

```javascript
const tx = await writeContract(config, {
  address: fundAddress,
  abi: FundABI,
  functionName: 'withdraw'
});
```

**Payout formula:**
```
payout = (yourShares x contractBalance) / totalShares
```

### Emergency Withdrawal (PAUSED > 48h)

If the platform pauses a fund and 48 hours pass without resolution:

```javascript
const tx = await writeContract(config, {
  address: fundAddress,
  abi: FundABI,
  functionName: 'emergencyWithdraw'
});
```

In emergency mode, success fees are waived — you get your full pro-rata share.

---

## Success Fee Calculation

The fund manager earns a 20% success fee on profits, calculated using a **high-water mark**:

```
valuePerShare = returnedAmount / totalShares
profit = valuePerShare - highWaterMark
fee = profit x totalShares x 20%
```

- **High-water mark** prevents double-charging: fees only apply to NEW profits above the previous high
- **Losses are absorbed** — no fee charged until the fund recovers past its previous peak
- **Emergency mode** waives all fees

---

## Risks

| Risk | Severity | Mitigation |
|------|----------|------------|
| Fund manager makes bad trades | High | Monitor holdings, exit during decision window |
| Smart contract bug | Low | Audited, reentrancy-protected, CEI pattern |
| Platform goes offline | Medium | 48h emergency timeout enables self-help withdrawal |
| Front-running on deposits | Low | Accepted design trade-off (no MEV protection) |
| Precision loss on tiny amounts | Very Low | Min withdrawal enforced on-chain |

---

## Events to Monitor

Subscribe to these on-chain events for automated tracking:

| Event | When |
|-------|------|
| `Deposit(investor, amount, shares, totalShares)` | New investment |
| `Withdrawal(investor, shares, remaining, ethAmount)` | Direct withdrawal |
| `StateChanged(oldState, newState)` | Fund state transition |
| `EpochEnded(epochNumber, timestamp)` | Trading epoch completed |
| `WithdrawalRequested(investor, shares)` | Exit vote submitted |
| `ExtensionApproved(requests, total)` | Fund continues |
| `WindDownTriggered(requests, total)` | Fund closing |
| `WithdrawalClaimed(investor, shares, amount)` | Payout received |
| `SuccessFeeCalculated(value, profit, fee)` | Performance fee assessed |

---

*See [trading.md](/trading.md) for fund management or [api.md](/api.md) for the complete API reference.*
