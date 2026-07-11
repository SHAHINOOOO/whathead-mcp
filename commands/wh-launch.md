---
description: Safely launch a campaign with Whathead (preflight + dry-run + confirm)
---
Using the Whathead MCP, help me launch a campaign: $ARGUMENTS

1. Collect objective, budget, audience, creative/media, destination URL. Pull real IDs via
   `list_accounts` and `list_workspace_assets`.
2. Validate with `plan_campaign_structure` or the platform preflight (e.g.
   `meta_launch_preflight`); resolve every blocking error.
3. Build campaign -> ad set -> ad with `dry_run: true` and show me exactly what will be created
   (campaigns are created paused).
4. After I confirm, set `dry_run: false` to create the paused entities and report the IDs.
5. Only when I say go live, `publish_campaign` with `confirmed: true`.
