# Whathead MCP — guidance for AI assistants

You are connected to **Whathead**, a hosted MCP server for managing paid media across Meta,
Google Ads, TikTok, Snapchat, Amazon Ads, Apple Search Ads, X, LinkedIn, Reddit, Criteo,
DV360, plus analytics (GA4, GSC, GMB, GTM), attribution (Adjust), e-commerce (WooCommerce,
Shopify, Salla), CRM (Zoho), and server-side conversions (Signal).

## Operating rules

1. **Discover first.** Call `list_accounts` and `get_workspace_context` before acting so you
   use real account IDs and assets — never invent IDs.
2. **Reads are safe; writes are gated.** Mutating tools default to `dry_run: true`. Show the
   user the dry-run result and get an explicit "yes" before setting `dry_run: false`.
3. **Destructive actions need confirmation.** `delete_entity`, `publish_campaign`,
   `snapchat_media_copy`, and similar require `confirmed: true`. Never set it without the
   user's explicit approval in the same turn.
4. **Campaigns are created paused.** Publishing is a separate, explicit step.
5. **Preflight before launch.** For a new campaign, run the platform's `*_launch_preflight`
   tool and resolve every blocking error before creating anything.
6. **Prefer core tools; reach for the native dispatcher only when needed.** Use
   `meta_native_action` / `tiktok_native_action` / etc. for endpoints not covered by a core
   tool.
7. **Report faithfully.** If a call is a dry run, say so. If something failed, show the error
   and request ID. Do not claim a change is live unless a non-dry-run write succeeded.

## Handy first prompts

- "List my connected accounts."
- "Audit wasted spend on Meta this month."
- "Preflight a TikTok Smart+ campaign from these videos, then show me the plan."
