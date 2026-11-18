# Connect Whathead to Claude Code

**Add the server:**

```bash
claude mcp add --transport http whathead https://www.whathead.com/mcp
```

**Authorize:** run `/mcp` inside Claude Code and complete the OAuth login in your browser.

**Project scope (optional):** commit a `.mcp.json` to your repo so teammates get it too:

```json
{
  "mcpServers": {
    "whathead": { "type": "http", "url": "https://www.whathead.com/mcp" }
  }
}
```

**Verify:**

> "Use Whathead to list my connected ad accounts."

**Manage:** `claude mcp list` to see it, `claude mcp remove whathead` to disconnect.
