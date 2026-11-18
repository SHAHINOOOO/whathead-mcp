# Connect Whathead to Gemini CLI

**Option A — install as an extension:**

```bash
gemini extensions install https://github.com/SHAHINOOOO/whathead-mcp
```

**Option B — add the server manually** to `~/.gemini/settings.json`:

```json
{
  "mcpServers": {
    "whathead": {
      "httpUrl": "https://www.whathead.com/mcp"
    }
  }
}
```

Restart Gemini CLI and complete the OAuth login.

**Verify:**

> "Use Whathead to list my connected ad accounts."
