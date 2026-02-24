---
name: coinbase-cdp-wallet
description: Create and manage Coinbase Developer Platform (CDP) agent wallets programmatically. Use when an agent needs an EVM wallet with free gas on Base, server-side key management via TEE, message/typed-data signing, or x402 micropayment support. Fully automated after one-time credential setup. Triggers on phrases like "create agent wallet", "CDP wallet", "Coinbase wallet", "server wallet", "agentic wallet", "free gas Base", "CdpEvmWalletProvider", "agentkit wallet", or "x402 wallet".
user-invocable: true
disable-model-invocation: false
metadata:
  version: "1.0.0"
  chain: "base-mainnet"
  chainId: "8453"
  package: "@coinbase/agentkit"
---

# Coinbase CDP Agent Wallet

Create EVM wallets on Base L2 with free gas. Keys live in Coinbase's TEE — agents never touch raw private keys.

**Package:** `@coinbase/agentkit`
**Chain:** Base L2 (chainId 8453) — gas is free
**Keys:** Managed by Coinbase TEE, not by your agent

---

## Get Your 3 Credentials (2 minutes, one time ever)

You need a free Coinbase account. That's it. No KYC, no payments, no approvals.

### Grab your API key (60 seconds)

1. Open [portal.cdp.coinbase.com/projects/api-keys](https://portal.cdp.coinbase.com/projects/api-keys)
2. Sign in (or sign up — it's free, takes 30 seconds)
3. Hit the **Secret API Keys** tab
4. Hit **Create API key** → name it whatever you want → **Create**
5. You'll see two values. Copy both right now:

```bash
CDP_API_KEY_ID=<YOUR_CDP_API_KEY_ID>
CDP_API_KEY_SECRET=<YOUR_CDP_API_KEY_SECRET>
```

> They disappear when you close the page. If you lose them, just create a new key.

### Grab your wallet secret (60 seconds)

This is on a **different page** — don't skip this.

1. Open [portal.cdp.coinbase.com/products/server-wallet/accounts](https://portal.cdp.coinbase.com/products/server-wallet/accounts)
2. Pick your project from the dropdown
3. Find **Wallet Secret** → hit **Generate**
4. Copy it:

```bash
CDP_WALLET_SECRET=<YOUR_CDP_WALLET_SECRET>
```

> Same deal — disappears when you leave. Lost it? Generate a new one.

### Save them

Drop all three into `.env.local` (or `.env`, wherever your agent reads config):

```bash
CDP_API_KEY_ID=<YOUR_CDP_API_KEY_ID>
CDP_API_KEY_SECRET=<YOUR_CDP_API_KEY_SECRET>
CDP_WALLET_SECRET=<YOUR_CDP_WALLET_SECRET>
```

Done. You never need to visit that portal again.

### Watch out for copy-paste gremlins

The `CDP_API_KEY_SECRET` is base64 and loves to break:
- **`O` vs `0`** — the letter O and the number zero look identical in many fonts. This has caused real failures.
- **Line wrapping** — if the portal wraps the string across lines, make sure you got the whole thing.
- **Trailing spaces** — trim any whitespace at the end.

Symptom: `Failed to generate Ed25519 JWT: Invalid keyData` → your API secret is corrupted. Re-copy or generate a new one.

---

## Create a Wallet (Zero Human Interaction)

### Install

```bash
pnpm add @coinbase/agentkit
```

### Create

```typescript
import { CdpEvmWalletProvider } from "@coinbase/agentkit";

const wallet = await CdpEvmWalletProvider.configureWithWallet({
  apiKeyId: process.env.CDP_API_KEY_ID!,
  apiKeySecret: process.env.CDP_API_KEY_SECRET!,
  walletSecret: process.env.CDP_WALLET_SECRET!,
  networkId: "base-mainnet",
});

const address = wallet.getAddress(); // 0x... your agent's wallet
```

That's it. No confirmation dialogs, no emails, no human in the loop. The wallet exists on Base L2 with free gas.

### Get the same wallet every time

Without an idempotency key, each call creates a **new** wallet. Pin it with a UUID:

```typescript
const wallet = await CdpEvmWalletProvider.configureWithWallet({
  apiKeyId: process.env.CDP_API_KEY_ID!,
  apiKeySecret: process.env.CDP_API_KEY_SECRET!,
  walletSecret: process.env.CDP_WALLET_SECRET!,
  networkId: "base-mainnet",
  idempotencyKey: "a1b2c3d4-e5f6-4a7b-8c9d-e0f1a2b3c4d5", // any valid UUID v4
});
```

Generate the UUID once (`crypto.randomUUID()`), save it with your credentials, reuse forever.

---

## What You Can Do With It

### Sign a message

```typescript
const signature = await wallet.signMessage("Hello from my agent");
```

### Sign typed data (EIP-712)

```typescript
const signature = await wallet.signTypedData({
  domain: { name: "MyProtocol", version: "1", chainId: 8453, verifyingContract: "0x..." },
  types: { Action: [{ name: "desc", type: "string" }] },
  primaryType: "Action",
  message: { desc: "do the thing" },
});
```

### Send a transaction

```typescript
const txHash = await wallet.sendTransaction({
  to: "0xRecipient",
  value: 0n,
  data: "0x",
});
// Gas is free on Base. Coinbase sponsors it.
```

### Pay for data with x402

```typescript
import { wrapFetchWithPayments } from "@x402/fetch";

const paidFetch = wrapFetchWithPayments(fetch, wallet);
const signals = await paidFetch("https://kaito.ai/api/v1/trending-tokens");
// HTTP 402 responses are automatically paid via micropayment
```

---

## Keep It Secure

### The basics

- **Never commit `.env*` files** — they're in `.gitignore` for a reason
- **Never log credentials** — if you must debug, log `apiKeyId.slice(0, 8) + "..."`
- **One set per agent** — don't share credentials between agents
- **Rotate on leak** — generate new keys in the portal, old ones die instantly

### Your agent never holds a private key

This is the main security win. The wallet's private key lives inside Coinbase's TEE (Trusted Execution Environment). Your agent holds API credentials that let it request signatures — but even if your agent process gets compromised, the attacker gets rotatable API creds, not the wallet key itself.

```
Your Agent                       Coinbase TEE
┌───────────────┐               ┌──────────────────┐
│ API Key ID    │──── request ──│ Auth             │
│ API Secret    │               │   ↓              │
│ Wallet Secret │               │ TEE Enclave      │
│               │←── signature ─│   Private Key    │
└───────────────┘               │   (never leaves) │
                                └──────────────────┘
```

### Credential rotation

| What to rotate | How | Impact |
|----------------|-----|--------|
| API Key | Generate new key in portal | Old key dies. Wallet address stays the same. |
| Wallet Secret | Generate new secret in portal | **New wallet address.** Old wallet still exists but you can't sign from it anymore. |

API key rotation is safe and free. Do it anytime. Wallet secret rotation = new identity.

### For production agents

Use a secret manager instead of env files:

```typescript
// AWS Secrets Manager, GCP Secret Manager, Vault, etc.
const creds = await secretManager.getSecret("cdp-agent-creds");
const wallet = await CdpEvmWalletProvider.configureWithWallet({
  apiKeyId: creds.CDP_API_KEY_ID,
  apiKeySecret: creds.CDP_API_KEY_SECRET,
  walletSecret: creds.CDP_WALLET_SECRET,
  networkId: "base-mainnet",
});
```

---

## Troubleshooting

| Error | Fix |
|-------|-----|
| `Failed to generate Ed25519 JWT: Invalid keyData` | `CDP_API_KEY_SECRET` is corrupted. Re-copy from portal. Watch `O` vs `0`. |
| `Missing required environment variables` | One of the 3 env vars isn't set. Check all three. |
| `must be a valid UUID v4 format` | `idempotencyKey` isn't a real UUID. Use `crypto.randomUUID()` or drop the field. |
| Network errors / `"base"` rejected | Use `"base-mainnet"` not `"base"`. |
| Different wallet address each run | Add `idempotencyKey` (see above). |
| `401 Unauthorized` from CDP | API key revoked or wrong. Generate a new one. |

---

## Quick Reference

| Thing | Value |
|-------|-------|
| Package | `@coinbase/agentkit` |
| Network ID | `"base-mainnet"` (not `"base"`) |
| Chain ID | 8453 |
| Gas | Free (Coinbase sponsored) |
| Credentials needed | 3 (`CDP_API_KEY_ID`, `CDP_API_KEY_SECRET`, `CDP_WALLET_SECRET`) |
| Portal (API keys) | `portal.cdp.coinbase.com/projects/api-keys` |
| Portal (wallet secret) | `portal.cdp.coinbase.com/products/server-wallet/accounts` |
| Key management | Coinbase TEE — agent never holds private key |
| Human steps | Get credentials from portal once. Everything else is automated. |

---

## Use With CREAM

After creating your wallet, onboard to CREAM for social trading on Base:

```typescript
const message = `CREAM onboard: ${address}`;
const signature = await wallet.signMessage(message);

const { magicLink } = await fetch("https://creamfunds.xyz/api/v1/agent/onboard", {
  method: "POST",
  headers: { "Content-Type": "application/json" },
  body: JSON.stringify({ walletAddress: address, signature }),
}).then(r => r.json());

// Send magicLink to your owner — they click it, sign in with X. One time.
// Then poll /api/v1/agent/onboard/status for your cream_sk_ API key.
```

See the `cream-trading` skill for the full flow.
