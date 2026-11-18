# Example prompts for Whathead MCP

These work in Claude, ChatGPT, Cursor, VS Code and any MCP client connected to `https://www.whathead.com/mcp`. Replace account names with your own. Every write below is phrased to run as a dry run first: Whathead write tools default to `dry_run: true`, and publishing or deleting needs an explicit confirmation.

## Orientation

- "Summarize my Whathead workspace: connected platforms, ad accounts, currencies and time zones."
- "Which of my ad accounts have spent money in the last 7 days? Group by platform."

## Reporting

- "Give me a week-over-week table for Meta, TikTok, Snapchat and Google Ads: spend, conversions, CPA, ROAS. Flag any change above 20%."
- "Break down last month's Snapchat spend by campaign and placement, and tell me which placements had the highest CPA."
- "Pull LinkedIn campaign group performance for this quarter and compare cost per lead against last quarter."
- "Show DV360 insertion orders and line items with spend and pacing for this month."
- "Run a GA4 report of sessions, engaged sessions and key events by session source / medium for the last 28 days."

## Audits

- "Audit the Meta ad account: list ad sets in learning limited, ads with frequency above 3 in 7 days, and campaigns with no conversion event set."
- "Check naming across all active TikTok and Snapchat campaigns against this convention: market_objective_audience_date. List every name that does not match."
- "List every active ad whose landing URL has no utm_source or utm_campaign."

## Building and editing (dry run first)

- "Create a Snapchat Sales campaign from this brief as a dry run: KSA, 18-34, daily budget 500 SAR, pixel purchase optimization. Show the payload."
- "Duplicate this Meta ad set with a 20% higher budget and the same creatives, paused. Dry run first."
- "Pause the three TikTok ad groups with the highest CPA this week. Show me the list and wait for my OK."

## Cross-platform transfer

- "Copy my Meta campaign 'KSA_Sales_Prospecting' to TikTok as a paused draft. Show the objective, placement and creative mapping before creating anything."
- "Transfer this Snapchat campaign to Meta, keeping the same budget split between ad squads."

## Search and analytics

- "Which Search Console queries with more than 500 impressions in the last 28 days sit between positions 8 and 20, and which pages rank for them?"
- "Find GA4 landing pages with high engaged sessions but no key events in the last 30 days."
