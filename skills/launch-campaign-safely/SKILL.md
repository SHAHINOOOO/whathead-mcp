---
name: launch-campaign-safely
description: Launch a new ad campaign with Whathead using the preflight -> dry-run -> confirm flow so nothing goes live by accident. Use when the user wants to create, build, or launch a campaign, ad set, or ad.
---

# Launch a campaign safely

Use the **Whathead** MCP to build a campaign without accidental spend.

## Steps

1. **Gather intent.** Platform, objective, budget, audience, creative/media, and destination
   URL. Call `list_accounts` and `list_workspace_assets` for real IDs (pixel, page, catalog).
2. **Plan.** Use `plan_campaign_structure` (or the platform preflight, e.g.
   `meta_launch_preflight` / `tiktok_launch_preflight`) to validate the intended tree against
   objective, budget, creative, and asset rules. Resolve every blocking error first.
3. **Dry-run build.** Create campaign -> ad set -> ad with `dry_run: true`. Show the user
   exactly what will be created (campaigns are created **paused**).
4. **Confirm & create.** After an explicit "yes", set `dry_run: false` to create the paused
   entities. Report the created IDs.
5. **Publish separately.** Only when the user says go live, use `publish_campaign` /
   `set_entity_status` with `confirmed: true`.

## Guardrails
- Never skip the preflight. Never publish without a separate, explicit confirmation.
- Keep the campaign paused until the user approves going live.
