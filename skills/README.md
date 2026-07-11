# Whathead Skills

Ready-to-use [Agent Skills](https://docs.claude.com/en/docs/claude-code/skills) that drive the
Whathead MCP for common paid-media jobs. Each folder is a self-contained skill with a
`SKILL.md`.

| Skill | What it does |
|---|---|
| [`audit-wasted-spend`](./audit-wasted-spend/SKILL.md) | Find wasted spend across platforms and safely pause the worst offenders. |
| [`weekly-report`](./weekly-report/SKILL.md) | Build a cross-platform weekly performance report and export it. |
| [`launch-campaign-safely`](./launch-campaign-safely/SKILL.md) | Preflight → dry-run → confirm launch flow for a new campaign. |
| [`setup-server-side-tracking`](./setup-server-side-tracking/SKILL.md) | Stand up server-side conversions (Signal CAPI) for a pixel. |

## Install (Claude Code)

Copy a skill folder into your project's `.claude/skills/` (or `~/.claude/skills/` for global):

```bash
cp -r skills/audit-wasted-spend ~/.claude/skills/
```

Then invoke it by asking, e.g. *"audit wasted spend on Meta this month."* The matching
`commands/` files expose the same jobs as slash commands.
