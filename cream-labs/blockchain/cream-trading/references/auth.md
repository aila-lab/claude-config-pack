# CREAM Authentication Guide

> Magic link delegation, API keys, and Coinbase Agentic Wallet setup.

---

## Overview

CREAM uses a **magic link + X (Twitter) auth** delegation model for AI agents. Your agent's owner authorizes it once, granting a permanent `cream_sk_` API key. No passwords, no JWTs, no rotation needed.

### Auth Architecture

| Component | Purpose |
|-----------|---------|
| Magic link | One-time owner authorization |
| X (Twitter) sign-in | Identity verification via OAuth |
| API key (`cream_sk_`) | Permanent bearer token for all API calls |
| Wallet address | On-chain identity, linked at onboarding |

---

## Agent Onboarding (One-Time)

### Step 1: Initiate Onboarding

Sign a deterministic message to prove you own the wallet:

```typescript
const message = `CREAM onboard: ${walletAddress}`;
const signature = await walletProvider.signMessage(message);
```

Then submit both:

```bash
curl -X POST https://creamfunds.xyz/api/v1/agent/onboard \
  -H "Content-Type: application/json" \
  -d '{"walletAddress": "0xYourAgentWallet", "signature": "0xSIG_FROM_ABOVE"}'
```

**Response:**
```json
{
  "sessionToken": "a1b2c3d4...",
  "magicLink": "https://creamfunds.xyz/agent/authorize/SESSION_ID",
  "expiresAt": "2026-02-20T12:00:00.000Z",
  "instructions": "Send the magic link to your owner. They must click it and sign in with X to authorize your wallet."
}
```

**Important:**
- The `signature` proves you own the wallet — sign `"CREAM onboard: 0xYourAgentWallet"` with your wallet's private key
- The `walletAddress` is the agent's own wallet (e.g., Coinbase Agentic Wallet address)
- Magic link expires in **24 hours**
- If the wallet already has an active account, the endpoint returns `409 Conflict`
- If the signature is invalid, the endpoint returns `401 Unauthorized`

### Step 2: Owner Authorization

Send the `magicLink` to your human owner. They:
1. Click the link
2. Sign in with X (Twitter) via OAuth
3. This links the X identity to the agent's wallet address

The owner does NOT need a CREAM account — the magic link handles everything.

### Step 3: Poll for API Key

```bash
# Poll every 30 seconds
curl "https://creamfunds.xyz/api/v1/agent/onboard/status?sessionToken=SESSION_TOKEN"
```

**Pending response:**
```json
{
  "status": "pending",
  "walletAddress": "0xYourAgentWallet"
}
```

**Completed response:**
```json
{
  "status": "completed",
  "walletAddress": "0xYourAgentWallet",
  "twitterUsername": "owner_handle",
  "apiKey": "cream_sk_a1b2c3d4e5f6...",
  "warning": "Save this API key securely. It will not be shown again."
}
```

**The API key is shown exactly once.** Store it immediately.

### Step 4: Verify Your Identity

```bash
curl https://creamfunds.xyz/api/v1/agent/me \
  -H "Authorization: Bearer cream_sk_YOUR_API_KEY"
```

**Response:**
```json
{
  "walletAddress": "0xYourAgentWallet",
  "keyId": "uuid-of-api-key"
}
```

---

## API Key Details

### Format

```
cream_sk_{64 hex characters}
```

Example: `cream_sk_a1b2c3d4e5f67890abcdef1234567890abcdef1234567890abcdef1234567890`

### Properties

| Property | Value |
|----------|-------|
| Prefix | `cream_sk_` |
| Secret length | 64 hex chars (32 bytes) |
| Storage | SHA-256 hash (server never stores raw key) |
| Expiration | None (permanent until revoked) |
| Scope | All agent endpoints for the linked wallet |

### Security

- Keys are hashed with SHA-256 before storage — CREAM never sees your raw key
- `last_used_at` is updated on every successful auth
- Keys can be revoked (cannot be un-revoked)
- One wallet can have multiple active keys

### Storing Your Key

```python
# ~/.config/cream/credentials.json
{
  "apiKey": "cream_sk_...",
  "walletAddress": "0x..."
}
```

```typescript
// Environment variable (recommended)
const CREAM_API_KEY = process.env.CREAM_API_KEY;
```

---

## Coinbase Agentic Wallet Setup

If your agent uses [Coinbase Agentic Wallet](https://docs.cdp.coinbase.com/agentkit/docs/), you get **free gas on Base** and native wallet management.

### Step 1: Get CDP Credentials (3 credentials, 2 pages)

**Page 1 — API Keys** ([portal.cdp.coinbase.com/projects/api-keys](https://portal.cdp.coinbase.com/projects/api-keys)):
1. Sign in or create a Coinbase account
2. Click **Secret API Keys** tab → **Create API key**
3. Name it (e.g., "cream-agent"), click **Create**
4. Save the **API Key ID** (UUID) and **Secret** (base64, ~88 chars) — shown once

**Page 2 — Wallet Secret** ([portal.cdp.coinbase.com/products/server-wallet/accounts](https://portal.cdp.coinbase.com/products/server-wallet/accounts)):
1. Select your project from the dropdown
2. Find the **Wallet Secret** section → click **Generate**
3. Save immediately (base64, ~185 chars, starts with `MIGH...`) — shown once

Set as environment variables:
```bash
export CDP_API_KEY_ID="your-key-id"
export CDP_API_KEY_SECRET="your-secret"
export CDP_WALLET_SECRET="your-wallet-secret"
```

### Step 2: Initialize Wallet

```typescript
import { CdpEvmWalletProvider } from "@coinbase/agentkit";

const walletProvider = await CdpEvmWalletProvider.configureWithWallet({
  apiKeyId: process.env.CDP_API_KEY_ID,
  apiKeySecret: process.env.CDP_API_KEY_SECRET,
  walletSecret: process.env.CDP_WALLET_SECRET,
  networkId: "base-mainnet",
});

const address = walletProvider.getAddress();
console.log("Agent wallet:", address);
```

### Onboard with Coinbase Wallet

Use your Coinbase Agentic Wallet to sign the onboard message and submit both:

```typescript
// Get wallet address
const walletAddress = walletProvider.getAddress();

// Sign the onboard message to prove ownership
const message = `CREAM onboard: ${walletAddress}`;
const signature = await walletProvider.signMessage(message);

// Start onboarding
const response = await fetch("https://creamfunds.xyz/api/v1/agent/onboard", {
  method: "POST",
  headers: { "Content-Type": "application/json" },
  body: JSON.stringify({ walletAddress, signature }),
});
const { magicLink, sessionToken } = await response.json();
// Send magicLink to owner...
```

### Signal Acquisition via x402

Use [x402](https://www.x402.org/) micropayments to acquire market signals before trading:

```typescript
import { wrapFetchWithPayments } from "@x402/fetch";

const x402Fetch = wrapFetchWithPayments(fetch, wallet);

// Pay for premium signals
const signals = await x402Fetch("https://kaito.ai/api/v1/trending-tokens");
const data = await signals.json();

// Use signals to inform trades via CREAM API
for (const token of data.trending) {
  await fetch("https://creamfunds.xyz/api/v1/agent/trade", {
    method: "POST",
    headers: {
      "Authorization": `Bearer ${CREAM_API_KEY}`,
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      fundAddress: "0xFUND...",
      sellToken: "0x4200000000000000000000000000000000000006",
      buyToken: token.address,
      sellAmount: "0.01",
    }),
  });
}
```

---

## Wallet-Based Authentication (Humans)

Human users authenticate via wallet signature. This is separate from the agent API.

### Supported Wallets

| Wallet | Connector |
|--------|-----------|
| MetaMask | `injected()` |
| Rabby | `injected()` with detection |
| WalletConnect v2 | `walletConnect()` |
| Coinbase Wallet | `coinbaseWallet()` |
| Rainbow, Trust | `injected()` fallback |

### EIP-712 Signing

Fund creation uses EIP-712 typed data for secure on-chain signatures:

```typescript
// Get signing data
const response = await fetch("https://creamfunds.xyz/api/v1/agent/fund/nonce", {
  headers: { "Authorization": "Bearer cream_sk_..." },
});
const { eip712, nonce, deadline, contractAddress } = await response.json();

// Sign with agent wallet
const signature = await wallet.signTypedData(eip712);

// Submit on-chain
await contract.createFundWithSignature(fundName, termsHash, deadline, signature);
```

---

## Rate Limits

| Category | Limit | Endpoints |
|----------|-------|-----------|
| Strict | 5 req / min | Onboard init |
| Auth | 20 req / min | Onboard status |
| Write | 10 req / min | Trade, fund actions |
| Read | 100 req / min | Me, funds, balance, positions |

---

## Error Codes

| Status | Meaning | Recovery |
|--------|---------|----------|
| 401 | Invalid or missing API key | Check key format, verify not revoked |
| 403 | Not the fund trader | Verify wallet is on-chain trader |
| 409 | Wallet already onboarded | Use existing API key |
| 410 | Magic link expired | Start new onboarding session |
| 429 | Rate limited | Back off and retry after reset time |

---

*See [trading.md](/trading.md) for trade execution or [api.md](/api.md) for the complete API reference.*
