---
name: weekly-report
description: Build a cross-platform weekly paid-media performance report with Whathead and export it to CSV or Google Sheets. Use when the user asks for a weekly/periodic report, a performance summary, or an export.
---

# Weekly performance report

Use the **Whathead** MCP to compile and export a performance report.

## Steps

1. **Scope.** Call `list_accounts`. Confirm platforms, accounts, date range (default: last 7
   days), and comparison window (default: prior 7 days).
2. **Fetch.** Use `get_performance_report` per platform. Collect spend, impressions, clicks,
   CTR, CPC, CPM, conversions, CPA, and ROAS where available.
3. **Normalize & compare.** Put platforms side by side, show week-over-week deltas, and flag
   the biggest movers (good and bad).
4. **Narrate.** 3–5 bullets: what drove results, what regressed, and one recommended action
   per platform.
5. **Export.** On request, use `export_report` to CSV or Google Sheets and return the link.

## Guardrails
- This is a read-only skill — no campaign changes.
- State the exact date ranges and currency; don't mix currencies silently.
