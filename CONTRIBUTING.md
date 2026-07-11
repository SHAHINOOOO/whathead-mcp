# Contributing

Thanks for helping improve the Whathead MCP docs. This repository holds the **public
connection documentation, client configs, and skills** for the hosted Whathead MCP service —
not the service source code.

## What we welcome

- Fixes and improvements to the connection guides in [`docs/clients/`](./docs/clients/).
- New client guides as more MCP clients ship.
- Clarifications to the platform and tool docs.
- Typos, broken links, and formatting fixes.

## What belongs elsewhere

- **Bugs in the hosted service or a specific tool** → email support@whathead.com or open an
  issue with the `service` label; include the request ID from the error.
- **Security issues** → follow [SECURITY.md](./SECURITY.md) (do **not** open a public issue).
- **Feature requests for the product** → open an issue with the `feature` label.

## Workflow

1. Fork and branch from `main`.
2. Make your change. Keep docs concise and copy-paste-ready.
3. Run the validator: `bash scripts/validate.sh`.
4. Open a PR describing the change. One logical change per PR.

## Style

- Prefer short, task-oriented instructions over prose.
- Every config snippet must be complete and copy-pasteable.
- Use `https://whathead.com/mcp` as the canonical endpoint everywhere.
