# Whathead slash commands

[Custom slash commands](https://docs.claude.com/en/docs/claude-code/slash-commands) for Claude
Code that drive the Whathead MCP. Copy any file into `.claude/commands/` (project) or
`~/.claude/commands/` (global):

```bash
cp commands/wh-audit.md ~/.claude/commands/
```

| Command | Does |
|---|---|
| `/wh-audit` | Audit wasted spend and propose safe pauses. |
| `/wh-report` | Cross-platform weekly performance report. |
| `/wh-launch` | Preflight + dry-run launch of a new campaign. |
| `/wh-capi` | Set up server-side conversions (Signal CAPI). |
