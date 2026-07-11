# Connect Whathead to Cursor

Add the server to `.cursor/mcp.json` in your project (or `~/.cursor/mcp.json` for all
projects):

```json
{
  "mcpServers": {
    "whathead": {
      "type": "http",
      "url": "https://whathead.com/mcp"
    }
  }
}
```

Reload Cursor, open **Settings → MCP**, and complete the OAuth login for Whathead. The tools
appear in the Composer/Agent tool list.

**Verify:**

> "Use Whathead to list my connected ad accounts."
