# Security

Whathead handles credentials for live advertising accounts. Security is treated as a
first-class product requirement, not an afterthought.

## How authentication works

- **OAuth 2.1 with PKCE (S256).** You authorize Whathead from your AI client through a
  standard OAuth flow. No API keys or long-lived platform tokens are ever pasted into the
  client.
- **Scoped, rotating tokens.** Access tokens are short-lived and refreshed automatically;
  refresh tokens rotate on use.
- **Connector tokens (optional).** For headless automation (n8n, Manus), you can mint a
  connector token that is restricted to a specific set of tools, platforms, and account IDs.

## How your data is protected

- **Encrypted at rest.** Platform credentials are stored encrypted server-side and are
  **never** returned to the AI client.
- **Least privilege.** Every tool declares an OAuth scope (`read:accounts`,
  `read:campaigns`, `write:campaigns`, `read:reports`, …). A client only gets what it was
  granted.
- **Write safety.** All mutating tools default to `dry_run: true`. Destructive operations
  (delete, media copy, publish) additionally require `confirmed: true`.
- **Audit logging.** Every tool invocation is traced and recorded with a request ID.
- **Clean boundary.** The MCP server calls the Whathead backend, which is the only component
  that talks to ad-platform APIs. Credential handling, throttling, and error normalization
  live behind that boundary.

## Scopes

| Scope | Grants |
|---|---|
| `read:accounts` | List connected accounts and workspace assets. |
| `read:campaigns` | Read campaigns, ad sets, ads, creatives, audiences. |
| `write:campaigns` | Create/update/pause/publish campaigns and entities. |
| `read:reports` | Performance reporting and insights. |
| `write:exports` | Export reports to CSV / Google Sheets. |
| `read:signal` / `write:signal` | Signal CDP: CAPI setup, events, lead routing. |

## Reporting a vulnerability

Please **do not** open a public issue for security reports.

Email **security@whathead.com** with:

- a description of the issue and its impact,
- steps to reproduce, and
- any relevant logs or request IDs (redact secrets).

We aim to acknowledge within **2 business days** and to provide a remediation timeline after
triage. Responsible disclosure is appreciated and credited.

## Scope of this repository

This repository contains **only** public connection documentation and client configuration.
It contains no source code, secrets, or credentials.
