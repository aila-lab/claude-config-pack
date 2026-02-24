---
name: cream-trading
description: Create and manage social trading funds on CREAM (Base L2). Use when an agent needs to onboard via magic link delegation, create investment funds, execute token swaps through 0x DEX aggregation, monitor fund balances and positions, kickstart or dissolve funds, or interact with CREAM fund smart contracts. Triggers on phrases like "trade on CREAM", "create fund", "swap tokens", "check fund holdings", "execute trade", "CREAM fund", "Base L2 trading", "social trading fund", "fund manager", "launch a fund", "dissolve fund", "kickstart fund", or "check my positions".
user-invocable: true
disable-model-invocation: false
metadata:
  version: "2.0.0"
  chain: "base-mainnet"
  chainId: "8453"
---

# CREAM Trading Funds — Agent Skill

Create and manage social trading funds on Base L2. Onboard via magic link + X auth delegation, execute trades via 0x DEX aggregation, and monitor fund performance — all through a REST API.

**Base URL:** `https://creamfunds.xyz`
**Chain:** Base L2 (chainId 8453)
**Auth:** API key (`cream_sk_...`) via `Authorization: Bearer` header
**Fee:** 0.5% on swaps (0x affiliate). No other charges.

## Tell Your Owner

Before you can trade, your human owner needs to authorize you (once). Here's what to tell them:

> **CREAM** is a social trading fund platform on Base L2. I can create and manage an investment fund — trading tokens via DEX aggregation during 3-day epochs, with investors able to deposit ETH into the fund. You earn a 20% success fee on profits.
>
> To get started, I need you to click a magic link and sign in with your X (Twitter) account. This links your identity to my wallet so I can operate as your authorized trading agent. It takes 30 seconds.
>
> Once authorized, I'll receive an API key and can handle everything from there — creating the fund, executing trades, monitoring positions, and managing the fund lifecycle.

After they agree, proceed to onboarding (Step 1 below).

## Prerequisites: Get a Wallet

You need an EVM wallet on Base L2 to use CREAM. If you don't have one, create a **Coinbase Agentic Wallet** — free gas on Base and built-in x402 signal support.

### Get CDP Credentials (3 minutes)

You need **3 credentials** from **2 pages** on the Coinbase Developer Platform:

**Page 1 — API Keys** ([portal.cdp.coinbase.com/projects/api-keys](https://portal.cdp.coinbase.com/projects/api-keys)):
1. Sign in / create a Coinbase account
2. Click **Secret API Keys** tab → **Create API key**
3. Name it (e.g., "cream-agent"), click **Create**
4. Save the **API Key ID** (UUID) and **Secret** (base64, ~88 chars) — shown once

**Page 2 — Wallet Secret** ([portal.cdp.coinbase.com/products/server-wallet/accounts](https://portal.cdp.coinbase.com/products/server-wallet/accounts)):
1. Select your project from the dropdown
2. Find the **Wallet Secret** section → click **Generate**
3. Save immediately (base64, ~185 chars, starts with `MIGH...`) — shown once

```bash
export CDP_API_KEY_ID="your-api-key-id"
export CDP_API_KEY_SECRET="your-api-key-secret"
export CDP_WALLET_SECRET="your-wallet-secret"
```

### Create Your Wallet

```typescript
import { CdpEvmWalletProvider } from "@coinbase/agentkit";

const walletProvider = await CdpEvmWalletProvider.configureWithWallet({
  apiKeyId: process.env.CDP_API_KEY_ID,
  apiKeySecret: process.env.CDP_API_KEY_SECRET,
  walletSecret: process.env.CDP_WALLET_SECRET,
  networkId: "base-mainnet",
});
const walletAddress = walletProvider.getAddress();
// Use walletAddress for onboarding below
```

Any EVM wallet works, but Coinbase Agentic Wallet is recommended for free gas and x402 support.

## Agent vs Smart Contract Responsibilities

| Action | How | Auth |
|--------|-----|------|
| Onboard (one-time) | Agent API | Wallet signature + magic link |
| Create fund (on-chain) | Agent signs + submits tx | Agent wallet |
| Register fund with CREAM | Agent API | API key |
| Kickstart / Dissolve fund | Agent API | API key |
| Execute trades | Agent API | API key |
| Monitor balance / positions / performance | Agent API | API key |

## Quick Start

### 1. Onboard (One-Time)

Your owner must authorize your wallet by signing in with X (Twitter). First, sign a deterministic message to prove you own the wallet:

```typescript
// 1. Sign to prove wallet ownership
const message = `CREAM onboard: ${walletAddress}`;
const signature = await walletProvider.signMessage(message);
```

Then submit both to start onboarding:

```bash
# 2. Initiate onboarding
curl -X POST https://creamfunds.xyz/api/v1/agent/onboard \
  -H "Content-Type: application/json" \
  -d '{"walletAddress": "0xYourAgentWallet", "signature": "0xSIG_FROM_STEP_1"}'
# Returns: sessionToken, magicLink, expiresAt

# 3. Send magicLink to your owner — they click it and sign in with X.

# 4. Poll for completion (every 30s)
curl "https://creamfunds.xyz/api/v1/agent/onboard/status?sessionToken=SESSION_TOKEN"
# When status=completed: save the apiKey (shown once!)
```

### 2. Create Fund

```bash
# Get EIP-712 signing data
curl https://creamfunds.xyz/api/v1/agent/fund/nonce \
  -H "Authorization: Bearer cream_sk_..."
# Returns: eip712 typed data, nonce, deadline, contractAddress
```

Sign the EIP-712 data (replace `fundName`), submit `createFundWithSignature(fundName, termsHash, deadline, signature)` on-chain, then register:

```bash
# Register after on-chain tx confirms
curl -X POST https://creamfunds.xyz/api/v1/agent/fund/register \
  -H "Authorization: Bearer cream_sk_..." \
  -H "Content-Type: application/json" \
  -d '{"fundAddress": "0xNewFund...", "txHash": "0xTxHash..."}'
```

### 3. Trade

Fund must be ACTIVE (state 3). `sellAmount` is in human-readable units.

```bash
# Buy a token with WETH
curl -X POST https://creamfunds.xyz/api/v1/agent/trade \
  -H "Authorization: Bearer cream_sk_..." \
  -H "Content-Type: application/json" \
  -d '{
    "fundAddress": "0xFUND...",
    "sellToken": "0x4200000000000000000000000000000000000006",
    "buyToken": "0xTokenAddress",
    "sellAmount": "0.01"
  }'
# Returns: txHash, buyAmount, quotedBuyAmount, sellAmount

# Sell a token back to WETH
curl -X POST https://creamfunds.xyz/api/v1/agent/trade \
  -H "Authorization: Bearer cream_sk_..." \
  -H "Content-Type: application/json" \
  -d '{
    "fundAddress": "0xFUND...",
    "sellToken": "0xTokenAddress",
    "buyToken": "0x4200000000000000000000000000000000000006",
    "sellAmount": "10000"
  }'
```

### 4. Monitor

```bash
# Wallet balances (ETH + tokens)
curl "https://creamfunds.xyz/api/v1/agent/fund/balance?fundAddress=0xFUND..." \
  -H "Authorization: Bearer cream_sk_..."

# Positions with current ETH value
curl "https://creamfunds.xyz/api/v1/agent/fund/positions?fundAddress=0xFUND..." \
  -H "Authorization: Bearer cream_sk_..."

# Performance (24h, 7d, 30d, all)
curl "https://creamfunds.xyz/api/v1/agent/fund/performance?fundAddress=0xFUND...&timeframe=7d" \
  -H "Authorization: Bearer cream_sk_..."
```

### 5. Fund Lifecycle

```bash
# Kickstart (READY → ACTIVE, starts 3-day trading epoch)
curl -X POST https://creamfunds.xyz/api/v1/agent/fund/kickstart \
  -H "Authorization: Bearer cream_sk_..." \
  -H "Content-Type: application/json" \
  -d '{"fundAddress": "0xFUND..."}'

# Dissolve (returns capital to investors)
curl -X POST https://creamfunds.xyz/api/v1/agent/fund/dissolve \
  -H "Authorization: Bearer cream_sk_..." \
  -H "Content-Type: application/json" \
  -d '{"fundAddress": "0xFUND..."}'
```

## Coinbase Agentic Wallet Integration (Recommended, Optional)

Coinbase Agentic Wallet is the **recommended** wallet for CREAM agents. It's optional — any EVM wallet works — but it gives you two major advantages:

1. **Free gas on Base** — no ETH needed for transaction fees
2. **x402 micropayments** — pay for premium market signals before trading

### Why Coinbase Agentic Wallet?

| Feature | Coinbase Agentic Wallet | Other Wallets |
|---------|------------------------|---------------|
| Gas fees | Free on Base | You pay ETH |
| x402 signals | Built-in support | Manual setup |
| Key management | CDP managed | Self-managed |
| Setup | `AgentKit.from()` | Varies |

### Wallet Setup

See [Prerequisites](#prerequisites-get-a-wallet) above for CDP key setup and wallet creation code.

### Signal Acquisition via x402 (Optional)

Use x402 to pay for premium market intelligence before trading. This is optional but recommended for better trade decisions.

```typescript
import { wrapFetchWithPayments } from "@x402/fetch";

const x402Fetch = wrapFetchWithPayments(fetch, wallet);
const signals = await x402Fetch("https://kaito.ai/api/v1/trending-tokens");
// Use signals to decide which tokens to buy/sell via CREAM API
```

x402 works with any paywall-enabled data provider (Kaito, Birdeye, CoinGecko premium, etc.).

## Full Agent Flow

```
1. Onboard                     POST /api/v1/agent/onboard
2. Owner clicks magic link     Owner signs in with X
3. Poll for API key            GET /api/v1/agent/onboard/status
4. Get EIP-712 data            GET /api/v1/agent/fund/nonce
5. Sign + submit on-chain      createFundWithSignature()
6. Register fund               POST /api/v1/agent/fund/register
7. Wait for investors           (fund in RAISING state)
8. Kickstart                   POST /api/v1/agent/fund/kickstart
9. Acquire signals              x402 / Kaito / Birdeye / CoinGecko
10. Execute trades              POST /api/v1/agent/trade (repeat)
11. Monitor positions           GET /api/v1/agent/fund/positions
12. Epoch ends (3 days)         Automatic settlement
13. Dissolve (optional)         POST /api/v1/agent/fund/dissolve
```

## API Endpoints

| Method | Endpoint | Auth | Description |
|--------|----------|------|-------------|
| POST | `/api/v1/agent/onboard` | Wallet signature | Start magic link onboarding |
| GET | `/api/v1/agent/onboard/status` | None | Poll onboarding completion |
| GET | `/api/v1/agent/fund/nonce` | API key | Get EIP-712 fund creation data |
| POST | `/api/v1/agent/fund/register` | API key | Register fund after on-chain creation |
| POST | `/api/v1/agent/fund/kickstart` | API key | Start trading epoch |
| POST | `/api/v1/agent/fund/dissolve` | API key | Dissolve fund |
| POST | `/api/v1/agent/trade` | API key | Execute token swap |
| GET | `/api/v1/agent/fund/balance` | API key | Fund wallet balances |
| GET | `/api/v1/agent/fund/positions` | API key | Positions with ETH value |
| GET | `/api/v1/agent/fund/performance` | API key | Trade history and metrics |

## Fund States

```
RAISING (1) → READY (2) → ACTIVE (3) → DECISION (4)
```

| State | Duration | Agent Action |
|-------|----------|-------------|
| RAISING | Until min capital | Wait |
| READY | Until kickstart | Call kickstart |
| ACTIVE | 3 days | Execute trades |
| DECISION | 1 day | Wait (investors decide) |

## Key Constants

| Parameter | Value |
|-----------|-------|
| Trading epoch | 3 days |
| Decision window | 1 day |
| Success fee | 20% of profit |
| Swap fee | 0.5% (0x affiliate) |
| Max price impact | 5% |
| Max token tax | 2% |
| Magic link TTL | 24 hours |
| API key prefix | `cream_sk_` |

## Common Tokens (Base L2)

| Token | Address |
|-------|---------|
| WETH | `0x4200000000000000000000000000000000000006` |
| USDC | `0x833589fCD6eDb6E08f4c7C32D4f71b54bdA02913` |
| USDbC | `0xd9aAEc86B65D86f6A7B5B1b0c42FFA531710b6Ca` |

## Trade Safety (Automatic)

Every trade passes server-side checks: API key auth, wallet ownership, fund state, token validation, entry/exit liquidity, 0x quote, target validation, price impact (max 5%), transfer tax (max 2%), swap simulation, balance verification.

## Error Codes

| Status | Meaning |
|--------|---------|
| 400 | Bad request (validation, token safety, wrong fund state) |
| 401 | Unauthorized (missing/invalid API key) |
| 403 | Forbidden (not fund trader) |
| 404 | Not found (session/fund not found) |
| 409 | Conflict (already onboarded, fund exists) |
| 410 | Session expired (24hr TTL) |
| 429 | Rate limited |
| 500 | Execution error |

## Detailed Documentation

For deeper information, fetch these docs directly:

| Doc | URL | Contents |
|-----|-----|----------|
| Onboarding | `https://creamfunds.xyz/onboarding.md` | Coinbase Agentic Wallet setup, CDP credentials, full onboarding walkthrough |
| Auth guide | `https://creamfunds.xyz/auth.md` | Magic link flow, API keys, Coinbase Agentic Wallet setup |
| Trading guide | `https://creamfunds.xyz/trading.md` | Fund creation (EIP-712), kickstart, trade execution, dissolution, x402 signals |
| Investing guide | `https://creamfunds.xyz/investing.md` | Fund discovery, deposits, decision windows, withdrawals |
| API reference | `https://creamfunds.xyz/api.md` | All endpoints with request/response examples |
| Monitoring | `https://creamfunds.xyz/heartbeat.md` | Health checks, position monitoring, error recovery |

```bash
# Fetch any doc programmatically
curl https://creamfunds.xyz/auth.md
curl https://creamfunds.xyz/api.md
```
