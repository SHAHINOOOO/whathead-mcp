# Connect Whathead to Codex CLI

Add the server to `~/.codex/config.toml`:

```toml
[mcp_servers.whathead]
url = "https://www.whathead.com/mcp"
```

Restart Codex CLI. On first use it opens the OAuth login in your browser.

**Verify:**

> "Use Whathead to list my connected ad accounts."

> If your Codex version manages MCP servers via `codex mcp`, you can also run:
> `codex mcp add whathead --url https://www.whathead.com/mcp`
