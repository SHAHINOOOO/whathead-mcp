<div align="center">

<img src="https://www.whathead.com/logos/WhatheadLogo.png" alt="Whathead" width="96" height="96" />

# Whathead MCP

**One remote MCP server for the ad platforms your media plan actually buys.**

[![Whathead MCP connector](https://glama.ai/mcp/connectors/com.whathead/ads/badges/score.svg)](https://glama.ai/mcp/connectors/com.whathead/ads)
[![MCP Badge](https://lobehub.com/badge/mcp/shahinoooo-whathead-mcp)](https://lobehub.com/mcp/shahinoooo-whathead-mcp)
[![MCP Registry](https://img.shields.io/badge/MCP_Registry-com.whathead%2Fads-6E56CF)](https://registry.modelcontextprotocol.io/v0.1/servers?search=com.whathead)
[![Transport](https://img.shields.io/badge/transport-Streamable_HTTP-1f6feb)](#connect)
[![Auth](https://img.shields.io/badge/auth-OAuth_2.1_%2B_PKCE-2ea043)](#safety-model)
[![Ad writes](https://img.shields.io/badge/ad_writes-dry--run_first-f0883e)](#safety-model)

`https://www.whathead.com/mcp`

[Connect](#connect) · [Platforms](#platforms-and-capabilities) · [Safety](#safety-model) · [Example prompts](#example-prompts) · [Pricing](#pricing) · [Docs](https://docs.whathead.com/ai-assistant?utm_source=github&utm_medium=mcp-readme)

</div>

---

## What it is

Whathead is an ad-operations workspace and remote MCP server for performance marketers and agencies. It connects Meta, Google Ads, TikTok, Snapchat, LinkedIn, Reddit, X, Microsoft Ads, DV360, Criteo, Apple Ads and Amazon Ads, plus GA4, Search Console and Shopify, so teams can build, edit, transfer, report on and monitor campaigns from one workspace or from Claude, ChatGPT and other MCP clients.

The MCP server is hosted by Whathead. You do not install or run anything: point your MCP client at the URL above, sign in with your Whathead account, and your assistant can work with the ad accounts your workspace has connected.

**What this repository contains:** the MCP Registry manifest (`server.json`), the Glama manifest (`glama.json`), client configuration examples, example prompts and documentation. **It does not contain the server's source code.** See [License](#license).

## Connect

You need a Whathead account on a plan that includes MCP connectors (see [Pricing](#pricing)) and at least one ad platform connected in your workspace.

### Claude (claude.ai and Claude Desktop)

1. Open **Settings → Connectors → Add custom connector**.
2. Name it `Whathead` and paste `https://www.whathead.com/mcp`.
3. Click **Connect**, sign in to Whathead and approve access.
4. In a chat, enable Whathead from the tools menu and ask a question about your accounts.

### Claude Code

```bash
claude mcp add --transport http whathead https://www.whathead.com/mcp
```

Then run `/mcp` inside Claude Code, choose `whathead` and complete the browser sign-in.

### ChatGPT

1. In **Settings → Apps & Connectors**, open **Advanced settings** and turn on **Developer mode** (required for custom MCP connectors on most plans).
2. Create a connector with the URL `https://www.whathead.com/mcp` and OAuth authentication.
3. Sign in to Whathead and approve access.
4. Turn the connector on in each chat where you want to use it. The toggle is per chat; if Whathead shows as unavailable, it is usually not enabled in that conversation.

**Read-only connection.** For workspaces that only allow read-only tools, or accounts that should never change anything, use `https://www.whathead.com/mcp/read` instead. It uses the same sign-in, and every tool it lists is read-only (`readOnlyHint: true`): reporting, account and campaign reads for each platform. Any attempt to change data is refused before it reaches the ad platform.

### Cursor

Create a bearer token for Cursor on the [Whathead MCP connector page](https://www.whathead.com/connectors/mcp?utm_source=github&utm_medium=mcp-readme), then add this to `~/.cursor/mcp.json` (global) or `.cursor/mcp.json` (project):

```json
{
  "mcpServers": {
    "whathead": {
      "url": "https://www.whathead.com/mcp",
      "headers": { "Authorization": "Bearer ${env:WHATHEAD_MCP_TOKEN}" }
    }
  }
}
```

Keep the token in an environment variable, not in a committed file. You can restrict a token to specific ad accounts and tools when you create it.

### VS Code (GitHub Copilot agent mode)

Add to `.vscode/mcp.json`, or run **MCP: Add Server** from the Command Palette and choose HTTP:

```json
{
  "servers": {
    "whathead": {
      "type": "http",
      "url": "https://www.whathead.com/mcp"
    }
  }
}
```

VS Code opens the Whathead sign-in the first time a tool is used.

### Other clients (n8n, Manus, Antigravity, MCP Inspector)

Any client that speaks Streamable HTTP can connect to `https://www.whathead.com/mcp`. Clients that support MCP OAuth discover the authorization server automatically from `https://www.whathead.com/.well-known/oauth-protected-resource`. Automation tools without an OAuth flow use a bearer token from the connector page. More configs are in [`examples/`](./examples).

Full setup guide: [docs.whathead.com/ai-assistant/connect](https://docs.whathead.com/ai-assistant/connect?utm_source=github&utm_medium=mcp-readme)

## Platforms and capabilities

Verified against the Whathead codebase on 18 Nov 2026. "Native API actions" counts the platform API operations available through each gateway; your assistant discovers the exact inputs with `whathead_tool_help`.

| Platform | Read and report | Build and edit (create, update, pause) | Native API actions | MCP gateway |
|---|---|---|---|---|
| Meta (Facebook, Instagram) | Yes | Yes, incl. lead forms and page posts | 528 | `meta_native_action` |
| Google Ads | Yes | Yes (Google Ads API v23; actions flagged for confirmation) | 171 | `google_ads_native_action` |
| TikTok | Yes | Yes | 496 | `tiktok_native_action` |
| Snapchat | Yes | Yes, incl. lead forms and lead webhooks | 268 | `snapchat_native_action` |
| LinkedIn | Yes | Yes, incl. campaign groups and lead gen | 287 | `linkedin_native_action` |
| Reddit | Yes | Yes, incl. posts, lead gen and catalogs | 49 | `reddit_native_action` |
| X | Yes | Yes | 186 | `x_ads_native_action` |
| Microsoft Advertising | Yes | Yes (REST v13 campaign management, bulk, reporting) | 280 | `microsoft_ads_native_action` |
| Display & Video 360 | Yes, incl. Bid Manager reporting | Yes | 173 | `dv360_native_action` |
| Criteo Retail Media | Yes | Yes | 108 | `criteo_native_action` |
| Apple Ads | Yes | Yes | 172 | `apple_ads_native_action` |
| Amazon Ads (SP, SB, SD) | Yes | Yes | 188 | `amazon_native_action` |
| Google Analytics 4 | Reports, async report tasks, metadata | Audience exports | 12 tools | `ga4_native_action` |
| Google Search Console | Sites, sitemaps, URL inspection, search analytics | Submit and delete sitemaps | 16 | `google_search_console_native_action` |
| Shopify | Connect a store in the workspace (products, orders, inventory, sales) | Not yet exposed as MCP tools | n/a | n/a |

Also available through MCP: Google Tag Manager, Google Business Profile, Google Merchant Center, Klaviyo, Adjust, AppsFlyer, Microsoft Clarity and WooCommerce.

**Cross-platform workflows**

- **Campaign transfer.** `cross_platform_transfer` copies a full campaign tree (campaign, ad sets, ads, media) between Meta, TikTok and Snapchat, and from those into Google. It maps objectives, placements and creatives, and creates the copy paused by default. The transfer screen in the workspace also maps X, Reddit, LinkedIn and OpenAI Ads.
- **One workspace, many accounts.** Agencies assign ad accounts to client workspaces and scope each token to the accounts it may touch.
- **Monitoring (workspace).** The Anomaly Engine compares what is live with what was approved (objective, targeting, tracking, naming, budget) and flags pacing and performance anomalies for Meta, Snapchat, TikTok, X and DV360.

What it does not do: it does not run campaigns on its own. Your assistant proposes; you approve.

## Safety model

Letting an AI touch live ad accounts needs guardrails that do not depend on the model behaving well.

| Guardrail | How it works |
|---|---|
| Dry run first on ad platforms | Ad-platform write tools default to `dry_run: true` and return the exact payload or diff they would send. Nothing changes until the call is resent with `dry_run: false`. Google Tag Manager writes have no dry run, so they rely on explicit confirmation and workspace versions. |
| Explicit confirmation | Publishing and destructive actions also require `confirmed: true`. Google Ads actions carry a per-action confirmation flag. |
| Paused by default | Cross-platform transfers create paused entities unless you choose to publish after confirmation. |
| Idempotency | Writes accept an `idempotency_key`, so a retried call does not create duplicates. |
| OAuth 2.1 | Authorization code with PKCE, refresh tokens and dynamic client registration. No API keys pasted into chats. |
| Scopes | Nine scopes separate reading accounts, campaigns and reports from writing campaigns, exports, GTM and tracking. |
| Allowlists | A connector token can be limited to specific ad accounts and tools. |
| Annotations | Every tool declares `readOnlyHint`, `destructiveHint` and `openWorldHint`, so clients can ask before running writes. |
| Rate limits and logs | Per-session rate limiting, and a recent-calls log per client on the connector page. |
| Metering | Only successful live work counts against your plan. Drafts, dry runs and failed jobs do not. |

Security and data handling: [whathead.com/security-data](https://www.whathead.com/security-data?utm_source=github&utm_medium=mcp-readme) · Privacy policy: [whathead.com/privacy-policy](https://www.whathead.com/privacy-policy?utm_source=github&utm_medium=mcp-readme)

## Example prompts

Paste these into your client once Whathead is connected.

- "List my connected ad accounts by platform with currency, timezone and status."
- "Compare spend, CPA and ROAS for Meta, TikTok and Snapchat over the last 14 days, by campaign."
- "Find ad sets on Meta that spent more than 2x their target CPA in the last 7 days with no conversions. Show them, don't pause anything yet."
- "Copy my best-performing Meta prospecting campaign to Snapchat as a paused draft. Show me the field mapping first."
- "Check every active TikTok ad group for automatic placement and Smart+ settings, and list the ones that differ from manual placement."
- "Pull last month's DV360 line item performance and flag line items pacing more than 20% behind."
- "Build a Google Ads search campaign from this brief as a dry run and show me the payload."
- "Which Search Console queries with more than 500 impressions in the last 28 days rank between positions 8 and 20?"
- "Lower the daily budget of these three X campaigns by 15%. Dry run first."

More: [docs.whathead.com/ai-assistant/what-it-can-do](https://docs.whathead.com/ai-assistant/what-it-can-do?utm_source=github&utm_medium=mcp-readme) and [`examples/prompts.md`](./examples/prompts.md).

## Pricing

All plans include a 14-day free trial.

| Plan | Monthly | MCP access |
|---|---|---|
| Builder | $29 | No (visual builder, publishing, media plans, transfer) |
| MCP Actions | $39 | Yes |
| Operator Bundle | $65 | Yes, plus builder and client workspaces |
| Agency | $249 | Yes, more seats and accounts, priority support |

Current limits and annual pricing: [whathead.com/pricing](https://www.whathead.com/pricing?utm_source=github&utm_medium=mcp-readme)

## Docs and links

- Connect your AI assistant: [docs.whathead.com/ai-assistant/connect](https://docs.whathead.com/ai-assistant/connect?utm_source=github&utm_medium=mcp-readme)
- What the assistant can do: [docs.whathead.com/ai-assistant/what-it-can-do](https://docs.whathead.com/ai-assistant/what-it-can-do?utm_source=github&utm_medium=mcp-readme)
- Platform tools: [docs.whathead.com/ai-assistant/platform-tools](https://docs.whathead.com/ai-assistant/platform-tools?utm_source=github&utm_medium=mcp-readme)
- Cross-platform transfer: [docs.whathead.com/workflows/cross-platform-transfer](https://docs.whathead.com/workflows/cross-platform-transfer?utm_source=github&utm_medium=mcp-readme)
- Free paid-media skills for Claude: [github.com/SHAHINOOOO/claude-paid-media-skills](https://github.com/SHAHINOOOO/claude-paid-media-skills)
- Support: [whathead.com/support](https://www.whathead.com/support?utm_source=github&utm_medium=mcp-readme)

## In this repo

- [`docs/clients/`](./docs/clients/): step-by-step setup for Claude Desktop, Claude Code, ChatGPT, Cursor, Windsurf, Codex CLI, Gemini CLI and n8n
- [`docs/tools.md`](./docs/tools.md): the 25 gateways on `/mcp` and the read-only surface on `/mcp/read`
- [`docs/safety.md`](./docs/safety.md): dry-run, confirmation and scopes
- [`skills/`](./skills/) and [`commands/`](./commands/): Agent Skills and Claude Code slash commands
- [`examples/`](./examples/): ready-to-paste client configs and example prompts

## Registry entries

| Where | Identifier |
|---|---|
| Official MCP Registry | `com.whathead/ads` ([server.json](./server.json)) |
| Server Card | `https://www.whathead.com/mcp/server-card` |
| AI Catalog | `https://www.whathead.com/.well-known/ai-catalog.json` |
| OAuth protected resource metadata | `https://www.whathead.com/.well-known/oauth-protected-resource` |

## License

The Whathead MCP server and the Whathead service are proprietary and hosted by Whathead. Using them is governed by the [Terms of Service](https://www.whathead.com/terms-of-service). This repository holds the registry manifest, documentation, configuration examples and example prompts, which you may copy, modify and use to connect to and integrate with Whathead (see [LICENSE](./LICENSE)). "Whathead" and the Whathead logo are trademarks of Whathead and are not covered by that license.

Platform names are trademarks of their owners. Whathead is not affiliated with or endorsed by Meta, Google, TikTok, Snap, LinkedIn, Reddit, X, Microsoft, Criteo, Apple or Amazon.
