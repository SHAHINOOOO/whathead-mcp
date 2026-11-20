# Tool catalog

Whathead exposes two surfaces from the same OAuth server. The full, generated catalog of every
operation lives at [docs.whathead.com/ai-assistant/tool-catalog](https://docs.whathead.com/ai-assistant/tool-catalog).

| Endpoint | What `tools/list` shows |
|---|---|
| `https://www.whathead.com/mcp` | 25 compact gateways. Each takes an `operation` plus that operation's `arguments`. Ad-platform writes default to `dry_run: true` (Google Tag Manager writes have no dry run); live and destructive actions need explicit confirmation. |
| `https://www.whathead.com/mcp/read` | 25 read-only tools (`readOnlyHint: true`): the 4 read-only gateways below plus a `<platform>_native_read` twin of each write-capable gateway. Use it for reporting, audits and clients that only allow read tools. A token without any `write:*` scope gets this list on `/mcp` too. |

Use `whathead_tool_help` (with `gateway` and `operation`) to get the exact input schema of any
operation before calling it.

## Gateways on `/mcp`

### Read-only

| Tool | Title |
|---|---|
| `whathead_tool_help` | Tool help |
| `whathead_workspace` | Whathead workspace & accounts |
| `clarity_native_action` | Microsoft Clarity |
| `commerce_native_action` | Commerce stores |

### Read and write (annotated `destructiveHint: true`)

| Tool | Title |
|---|---|
| `whathead_native_action` | Whathead campaigns, reporting & transfer |
| `meta_native_action` | Meta Ads |
| `google_ads_native_action` | Google Ads |
| `tiktok_native_action` | TikTok Ads |
| `snapchat_native_action` | Snapchat Ads |
| `linkedin_native_action` | LinkedIn Ads |
| `reddit_native_action` | Reddit Ads |
| `x_ads_native_action` | X Ads |
| `microsoft_ads_native_action` | Microsoft Advertising |
| `dv360_native_action` | Display & Video 360 |
| `criteo_native_action` | Criteo Retail Media |
| `apple_ads_native_action` | Apple Ads |
| `amazon_native_action` | Amazon Ads |
| `ga4_native_action` | Google Analytics 4 |
| `gtm_native_action` | Google Tag Manager |
| `google_search_console_native_action` | Google Search Console |
| `google_business_native_action` | Google Business Profile |
| `google_merchant_native_action` | Google Merchant Center |
| `adjust_native_action` | Adjust |
| `appsflyer_native_action` | AppsFlyer |
| `klaviyo_native_action` | Klaviyo |

On `/mcp/read`, each of these 21 is replaced by its read-only twin, for example
`meta_native_read` (title "Meta Ads (read-only)"). A twin accepts the same read operations and
refuses anything that would create, change or delete.

## Scopes

Read operations need a `read:*` scope (`read:accounts`, `read:campaigns`, `read:reports`,
`read:signal`, `read:gtm`). Writes need the matching `write:*` scope (`write:campaigns`,
`write:signal`, `write:gtm`, `write:exports`). A client that requests no scope gets all of them.
