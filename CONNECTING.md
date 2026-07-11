# Connecting to Whathead MCP

Whathead is a **remote, hosted** MCP server. There is nothing to install or run locally —
you point your client at the endpoint and complete a one-time OAuth login.

**Endpoint**

```
https://whathead.com/mcp
```

**Transport:** Streamable HTTP · **Auth:** OAuth 2.1 + PKCE

Per-client guides live in [`docs/clients/`](./docs/clients/). Quick reference below.

---

## Claude Code

```bash
claude mcp add --transport http whathead https://whathead.com/mcp
```

Then run `/mcp` inside Claude Code and complete the login. See
[docs/clients/claude-code.md](./docs/clients/claude-code.md).

## Claude Desktop & Web

Settings → **Connectors** → **Add custom connector** → paste `https://whathead.com/mcp` →
authorize. See [docs/clients/claude-desktop.md](./docs/clients/claude-desktop.md).

## ChatGPT (Pro / Business / Enterprise)

Settings → **Connectors** → **Add** → custom MCP connector → `https://whathead.com/mcp`.
See [docs/clients/chatgpt.md](./docs/clients/chatgpt.md).

## Cursor

Add to `.cursor/mcp.json` (project) or `~/.cursor/mcp.json` (global):

```json
{
  "mcpServers": {
    "whathead": { "type": "http", "url": "https://whathead.com/mcp" }
  }
}
```

See [docs/clients/cursor.md](./docs/clients/cursor.md).

## Codex CLI

Add to `~/.codex/config.toml`:

```toml
[mcp_servers.whathead]
url = "https://whathead.com/mcp"
```

See [docs/clients/codex-cli.md](./docs/clients/codex-cli.md).

## Windsurf

Add to `~/.codeium/windsurf/mcp_config.json`:

```json
{
  "mcpServers": {
    "whathead": { "serverUrl": "https://whathead.com/mcp" }
  }
}
```

See [docs/clients/windsurf.md](./docs/clients/windsurf.md).

## Gemini CLI

```bash
gemini extensions install https://github.com/SHAHINOOOO/whathead-mcp
```

Or add the server to `~/.gemini/settings.json`. See
[docs/clients/gemini-cli.md](./docs/clients/gemini-cli.md).

## n8n / Manus / other automation

Use a **connector token** (mintable in your Whathead workspace) instead of interactive
OAuth, and restrict it to specific tools, platforms, and accounts. See
[docs/clients/n8n.md](./docs/clients/n8n.md).

---

## Verify the connection

Once connected, ask your client:

> "Use Whathead to list my connected ad accounts."

You should see your accounts with IDs, currency, and timezone. If a platform isn't
connected yet, connect it in your Whathead workspace first.

## Troubleshooting

| Symptom | Fix |
|---|---|
| `401 Unauthorized` | Re-run the OAuth login; your token may have expired. |
| Tools don't appear | Confirm the client supports **remote HTTP** MCP servers and reload it. |
| `subscription_required` | Your workspace needs an active plan with MCP access — see [pricing](https://whathead.com/pricing). |
| A platform is missing | Connect that platform inside your Whathead workspace, then retry. |
