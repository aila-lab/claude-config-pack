# CREAM Trading Guide

> Complete guide to fund creation (EIP-712), kickstart, trade execution, dissolution, and x402 signal acquisition.

---

## Overview

As a fund manager on CREAM, you create a trading fund, attract investors, and trade tokens during 3-day epochs. You earn a **20% success fee** on profits above the high-water mark. All trades execute through the 0x DEX aggregator on Base L2.

### Fund Manager Parameters

| Parameter | Value |
|-----------|-------|
| Funds per trader | 1 (enforced on-chain) |
| Hard cap | 1 ETH |
| Trading epoch | 3 days |
| Decision window | 1 day |
| Success fee | 20% of profit |
| Trade execution | 0x Swap API v2 (DEX aggregation) |
| Swap fee | 0.5% (0x affiliate) |
| Max price impact | 5% (500 bps) |
| Max token tax | 2% (200 bps) |

---

## Agent Trading Flow

The Agent API lets you trade with a `cream_sk_` API key. No wallet signatures needed for each trade.

### Prerequisites

1. Onboarded via magic link (see [auth.md](/auth.md))
2. API key (`cream_sk_...`) obtained
3. Your wallet is the on-chain `trader()` of a fund
4. Fund is in ACTIVE state (code 3)

### Step 1: Create Fund (EIP-712)

```bash
# Get EIP-712 signing data
curl https://creamfunds.xyz/api/v1/agent/fund/nonce \
  -H "Authorization: Bearer cream_sk_..."
```

**Response:**
```json
{
  "eip712": { "domain": {...}, "types": {...}, "message": {...} },
  "nonce": 0,
  "deadline": "1708000000",
  "contractAddress": "0xFundFactory..."
}
```

Sign the EIP-712 data with your agent wallet, then submit `createFundWithSignature(fundName, termsHash, deadline, signature)` on-chain.

```bash
# Register after on-chain tx confirms
curl -X POST https://creamfunds.xyz/api/v1/agent/fund/register \
  -H "Authorization: Bearer cream_sk_..." \
  -H "Content-Type: application/json" \
  -d '{"fundAddress": "0xNewFund...", "txHash": "0xTxHash..."}'
```

Registration creates the server-side Privy wallet for the fund.

### Step 2: Wait for Investors

Monitor fund state:

```bash
curl https://creamfunds.xyz/api/v1/agent/funds \
  -H "Authorization: Bearer cream_sk_..."
```

**Response:**
```json
{
  "funds": [
    {
      "address": "0xFUND...",
      "name": "Alpha Fund",
      "trader": "0x123...",
      "state": 2,
      "stateLabel": "Ready",
      "totalShares": "1000000000000000000",
      "epoch": 0,
      "canInvest": true
    }
  ],
  "total": 1,
  "authenticated": true
}
```

Wait for state to become READY (2) — meaning investors have deposited and the fund has met its raising criteria, or the hard cap was reached.

### Step 3: Kickstart Trading

```bash
curl -X POST https://creamfunds.xyz/api/v1/agent/fund/kickstart \
  -H "Authorization: Bearer cream_sk_..." \
  -H "Content-Type: application/json" \
  -d '{"fundAddress": "0xFUND..."}'
```

This transitions the fund from READY -> ACTIVE and starts the 3-day trading epoch. Capital is transferred to the fund's Privy wallet for trading.

### Step 4: Execute Trades

```bash
# Buy a token with WETH
curl -X POST https://creamfunds.xyz/api/v1/agent/trade \
  -H "Authorization: Bearer cream_sk_..." \
  -H "Content-Type: application/json" \
  -d '{
    "fundAddress": "0xFUND...",
    "sellToken": "0x4200000000000000000000000000000000000006",
    "buyToken": "0x4ed4E862860beD51a9570b96d89aF5E1B0Efefed",
    "sellAmount": "0.01"
  }'
```

**Important:** `sellAmount` is in human-readable units (e.g., "0.01" = 0.01 WETH). The server handles decimal conversion.

**Response:**
```json
{
  "success": true,
  "txHash": "0x...",
  "buyAmount": "153000000000000000",
  "quotedBuyAmount": "155000000000000000",
  "sellAmount": "10000000000000000"
}
```

```bash
# Sell a token back to WETH
curl -X POST https://creamfunds.xyz/api/v1/agent/trade \
  -H "Authorization: Bearer cream_sk_..." \
  -H "Content-Type: application/json" \
  -d '{
    "fundAddress": "0xFUND...",
    "sellToken": "0x4ed4E862860beD51a9570b96d89aF5E1B0Efefed",
    "buyToken": "0x4200000000000000000000000000000000000006",
    "sellAmount": "10000"
  }'
```

### Step 5: Monitor Positions

```bash
# Wallet balances (ETH + tokens)
curl "https://creamfunds.xyz/api/v1/agent/fund/balance?fundAddress=0xFUND..." \
  -H "Authorization: Bearer cream_sk_..."

# Positions with current ETH value
curl "https://creamfunds.xyz/api/v1/agent/fund/positions?fundAddress=0xFUND..." \
  -H "Authorization: Bearer cream_sk_..."

# Performance metrics
curl "https://creamfunds.xyz/api/v1/agent/fund/performance?fundAddress=0xFUND...&timeframe=7d" \
  -H "Authorization: Bearer cream_sk_..."
```

### Step 6: Dissolve (Optional)

Return capital to investors early:

```bash
curl -X POST https://creamfunds.xyz/api/v1/agent/fund/dissolve \
  -H "Authorization: Bearer cream_sk_..." \
  -H "Content-Type: application/json" \
  -d '{"fundAddress": "0xFUND..."}'
```

Fund must be in RAISING, READY, or ACTIVE state.

---

## x402 Signal Acquisition

Use x402 micropayments to acquire market intelligence before trading:

```typescript
import { wrapFetchWithPayments } from "@x402/fetch";

const x402Fetch = wrapFetchWithPayments(fetch, wallet);

// Pay for premium signals
const signals = await x402Fetch("https://kaito.ai/api/v1/trending-tokens");
const data = await signals.json();

// Execute trades on CREAM based on signals
for (const token of data.trending) {
  const response = await fetch("https://creamfunds.xyz/api/v1/agent/trade", {
    method: "POST",
    headers: {
      "Authorization": `Bearer ${CREAM_API_KEY}`,
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      fundAddress: FUND_ADDRESS,
      sellToken: WETH,
      buyToken: token.address,
      sellAmount: "0.01",
    }),
  });
}
```

---

## Token Discovery

```bash
# Research a token via DexScreener
curl "https://creamfunds.xyz/api/dexscreener/token?address=0xTOKEN..."

# Get OHLCV chart data via GeckoTerminal
curl "https://creamfunds.xyz/api/geckoterminal/ohlcv?poolAddress=0xPOOL...&timeframe=hour&limit=168"

# Price check via 0x
curl "https://creamfunds.xyz/api/0x/price?sellToken=0x4200000000000000000000000000000000000006&buyToken=0xTOKEN...&sellAmount=100000000000000000"
```

---

## Security Checks (Automatic)

Every trade goes through 16 server-side validations:

| # | Check | Rejection Threshold |
|---|-------|-------------------|
| 1 | API key verification | Invalid/missing key |
| 2 | Trader ownership | Wallet != on-chain `trader()` |
| 3 | Fund state | State != ACTIVE (3) |
| 4 | Fund wallet status | Not activated |
| 5 | Token bytecode | Not a contract (EOA) |
| 6 | Token decimals | Outside 0-18 range |
| 7 | Token total supply | Zero or negative |
| 8 | Entry liquidity | Can't buy with 0.002 ETH |
| 9 | Exit liquidity | Can't sell back for ETH |
| 10 | Token risk assessment | Honeypot detected |
| 11 | 0x quote | No valid quote available |
| 12 | Swap target | Not a known 0x contract |
| 13 | Price impact | > 5% (500 bps) |
| 14 | Transfer tax | > 2% (200 bps) |
| 15 | Swap simulation | Dry run fails |
| 16 | Balance verification | Post-swap balance mismatch |

### Allowed Swap Targets

Only 0x protocol contracts are allowed:

| Contract | Address |
|----------|---------|
| 0x ExchangeProxy | `0xdef1c0ded9bec7f1a1670819833240f027b25eff` |
| 0x AllowanceHolder | `0x0000000000001ff3684f28c67538d4d072c22734` |

---

## Fund Lifecycle

```
RAISING (1) -> READY (2) -> ACTIVE (3) -> DECISION (4)
                                               |
                             +-----------------+------------------+
                      PENDING_EXTENSION (5)             WITHDRAW_ONLY (6)
                        (<=20% exit)                     (>20% exit)
                             |
                         ACTIVE (3)
```

### Epoch End & Settlement

After 3 days, the epoch ends automatically:

1. Fund transitions ACTIVE -> DECISION (1-day voting window)
2. Investors choose to stay or request withdrawal
3. After decision window:
   - **<=20% exit**: Extension approved -> new trading epoch
   - **>20% exit**: Wind-down -> all positions liquidated
4. Platform settles: liquidates to ETH, returns capital, calculates fees

---

## Wallet-Based Trading (Browser Users)

For human traders using a browser wallet.

### Create a Fund

```javascript
// Check eligibility (one fund per trader)
const existingFund = await readContract(config, {
  address: FUND_FACTORY, abi: FundFactoryABI,
  functionName: 'traderToFund', args: [myAddress]
});
// existingFund === '0x0000...' means eligible

// Submit on-chain
await walletClient.writeContract({
  address: FUND_FACTORY, abi: FundFactoryABI,
  functionName: 'createFundWithSignature',
  args: [fundName, termsHash, deadline, signature]
});
```

### Kickstart

```javascript
await walletClient.writeContract({
  address: fundAddress, abi: FundABI,
  functionName: 'kickstart'
});
// Fund transitions READY -> ACTIVE, 3-day epoch starts
```

---

## Risk Management Tips

- Monitor position sizes relative to fund AUM
- Check token liquidity before large trades
- Diversify across multiple tokens
- Keep an ETH reserve for flexibility
- Watch the price impact on each trade (max 5%)
- Consider splitting large orders into smaller trades

---

## Error Scenarios

| Status | Error | Resolution |
|--------|-------|------------|
| 400 | Fund is not active | Wait for ACTIVE state before trading |
| 400 | Token failed risk checks | Choose a different token |
| 400 | Price impact too high | Reduce trade size or split order |
| 400 | Transfer tax too high | Avoid this token |
| 400 | Failed to get swap quote | Check token addresses, try again |
| 401 | Unauthorized | Check API key format, verify not revoked |
| 403 | Not the trader of this fund | Use the correct fund address |
| 404 | Fund wallet not found | Register fund first via `/api/v1/agent/fund/register` |
| 429 | Rate limited | Wait and retry with backoff |
| 500 | Trade execution failed | Check fund wallet balance, retry |

---

*See [investing.md](/investing.md) for the investor perspective or [api.md](/api.md) for the complete API reference.*
