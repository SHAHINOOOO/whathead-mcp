---
name: audit-wasted-spend
description: Find wasted ad spend across connected platforms with Whathead and safely pause the worst offenders. Use when the user asks to audit, cut, or reduce wasted spend, find underperformers, or clean up an account.
---

# Audit wasted spend

Use the **Whathead** MCP to find and (with approval) stop wasted spend.

## Steps

1. **Discover.** Call `list_accounts`. Confirm which platform/account and time window the user
   means (default: this month).
2. **Pull performance.** Use `get_performance_report` for the account/window at ad-set (and
   ad) level. Identify waste signals:
   - CPA / cost-per-result well above the account median.
   - High spend with zero or near-zero conversions.
   - Frequency > 3.5 (fatigue) with rising CPA.
   - Ad sets spending under the minimum needed to exit learning.
3. **Rank.** Present the top offenders in a table: entity, spend, CPA, the waste reason, and a
   recommended action (pause / lower budget / refresh creative).
4. **Act safely.** Only on the user's explicit go-ahead, use `set_entity_status` (pause) or
   `update_entities` (budget) — first as a **dry run**, show the diff, then apply after a
   confirmed "yes". Never pause live delivery without confirmation.
5. **Summarize.** Report what changed, estimated monthly savings, and what to watch next.

## Guardrails
- Reads are safe; every write is a dry run until the user confirms.
- Never invent IDs — use the ones returned by discovery/reporting.
