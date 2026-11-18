# Connect Whathead to n8n / Manus / automation

For headless automation you authenticate with a **connector token** instead of interactive
OAuth. A connector token can be locked to a specific set of tools, platforms, and account IDs
— so a workflow gets exactly the access it needs and nothing more.

## 1. Mint a connector token

In your Whathead workspace, open **Settings → MCP Connectors → Create token**, then scope it:

- **Tools** — e.g. only `get_performance_report`, `export_report`.
- **Platforms** — e.g. only `meta`, `google`.
- **Accounts** — specific account IDs.

Copy the token (shown once).

## 2. Point your automation at the endpoint

- **Endpoint:** `https://www.whathead.com/mcp`
- **Transport:** Streamable HTTP
- **Auth header:** `Authorization: Bearer <connector-token>`

In **n8n**, use the **MCP Client** node with the URL above and the token as a Bearer
credential. In **Manus** or other agents, add a custom MCP server with the same URL and header.

## 3. Rotate & revoke

Tokens can be rotated or revoked at any time from the same settings page. Rotate on a
schedule and immediately if a token may be exposed.

> Connector tokens are ideal for scheduled reporting and ops. Keep them **read-only** unless a
> workflow genuinely needs to write.
