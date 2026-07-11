---
description: Audit wasted ad spend with Whathead and propose safe pauses
---
Using the Whathead MCP, audit wasted spend for: $ARGUMENTS

1. `list_accounts`, then confirm the account and time window (default: this month).
2. `get_performance_report` at ad-set/ad level; flag high-CPA, zero-conversion, and
   fatigued (frequency > 3.5) entities.
3. Show the top offenders in a table with spend, CPA, reason, and recommended action.
4. Only after I confirm, apply pauses/budget cuts via `set_entity_status` / `update_entities`
   — dry run first, then apply. Never change live delivery without my explicit yes.
