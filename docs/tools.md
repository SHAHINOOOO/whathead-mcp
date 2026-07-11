# Tool catalog

Whathead's tools are grouped by function. Read tools require a `read:*` scope; write tools
default to `dry_run: true` and require a `write:*` scope. This page is a map — the exact tool
list your client sees depends on your plan, connected platforms, and granted scopes.

## Discovery

| Tool | Purpose |
|---|---|
| `list_accounts` | List connected ad accounts across all platforms. |
| `get_workspace_context` | User, company, billing, connected-platform summary, defaults. |
| `list_workspace_assets` | Pages, profiles, pixels, apps, catalogs, custom conversions. |

## Campaign lifecycle (cross-platform)

| Tool | Purpose |
|---|---|
| `list_campaigns` / `fetch_campaign` | List or fetch campaigns (with optional insights). |
| `fetch_adsets` / `fetch_ads` / `fetch_creatives` | Drill into the campaign tree. |
| `create_campaign` | Create a campaign (always paused; `dry_run` default). |
| `create_adset` / `create_ad` / `create_creative` | Build the tree. |
| `update_entities` | Update a campaign / ad set / ad (immutable fields guarded). |
| `set_entity_status` | Enable / pause across platforms. |
| `publish_campaign` | Activate a paused campaign (requires confirm). |
| `delete_entity` | Delete an entity (requires `dry_run` + confirm). |
| `compile_entity_payload` | Validate/compile a payload before you create. |
| `get_entity_insights` | Stats for a specific campaign / ad set / ad. |

## Native platform tools

One typed dispatcher per deep platform, reaching every documented endpoint:

| Tool | Reaches |
|---|---|
| `meta_native_action` | 528 Meta Graph Marketing API endpoints |
| `tiktok_native_action` | 377 TikTok Business API endpoints |
| `snapchat_native_action` | 312 Snapchat Marketing API endpoints |
| `amazon_native_action` | 184 Amazon Ads endpoints |
| `apple_ads_native_action` | 73 Apple Search Ads endpoints |

Plus per-platform **preflight** validators — e.g. `meta_launch_preflight`,
`tiktok_launch_preflight`, `snapchat_describe_report_capabilities` — that check a launch or
report request against platform rules before you commit.

## Creative & media

| Tool | Purpose |
|---|---|
| `list_creatives` / `list_media_assets` | Browse creatives and reusable media. |
| `platform_media_upload` | Upload media (signed URL, from URL, session, Google Drive). |
| `generate_creative_design` | Generate AI image creatives from an ad, prompt, or catalog. |
| `get_ad_preview` | Preview an ad before publishing. |
| `search_ads_library` | Search the Meta Ads Library for competitor ads. |

## Audiences & targeting

| Tool | Purpose |
|---|---|
| `list_audiences` | Audiences, lookalikes, interests, locations. |
| `estimate_audience_size` | Estimate reach of a targeting config. |
| `generate_ad_content` / `suggest_targeting` | AI copy and targeting ideas. |
| `plan_campaign_structure` | Preflight planner before a build. |

## Reporting

| Tool | Purpose |
|---|---|
| `get_performance_report` | Live cross-platform metrics (day / month / all). |
| `audit_campaign` | Health check with a 0–100 score and findings. |
| `get_optimization_suggestions` | Data-driven optimization recommendations. |
| `export_report` | Export to CSV or Google Sheets. |
| `get_reporting_*` (bootstrap/query/schedule/run) | Google Sheets reporting workflow. |

## Signal (CDP)

| Tool | Purpose |
|---|---|
| `signal_get_sites` / `signal_get_destinations` / `signal_get_connections` | Inventory. |
| `signal_capi_setup_meta` / `_snap` / `_tiktok` | Create a server-side CAPI destination. |
| `signal_capi_validate_event` / `_test_event` / `_route_event` | Validate, test, route events. |
| `signal_capi_get_delivery_attempts` / `_retry_failed` / `_get_quality` | Delivery + quality. |
| `signal_audit_site` / `signal_get_event_schema` | Site audit and event schema inference. |

## Specialized platforms

Dispatchers for Google Ads (`google_*_ops`), GA4 (`ga4_*`), DV360 (`dv360_action`),
GTM (`gtm_ops`), Google Business Profile (`gmb_*_ops`), Search Console (`gsc_*_ops`),
Adjust (`adjust_*`), Apple Search Ads legacy (`apple_ads_*_ops`), and e-commerce
(`woocommerce_store_ops`, `shopify_store_ops`, `salla_store_ops`).

## Cross-Platform Transfer

| Tool | Purpose |
|---|---|
| `cross_platform_transfer` | Migrate a campaign from one platform to another. |
