# Changelog

All notable changes to the Whathead MCP connection docs are recorded here. This project
follows [Semantic Versioning](https://semver.org).

## [1.1.0] — 2026-07-11

### Added
- Brand logo banner and a "works with" client strip in the README.
- Visual platform logo grid (Meta, Google, TikTok, Snapchat, Amazon, Apple, X, LinkedIn,
  Reddit, DV360, GA4, Search Console, Business Profile, Adjust).
- Live CI status badge.
- `skills/` — four ready-to-use Agent Skills: audit-wasted-spend, weekly-report,
  launch-campaign-safely, setup-server-side-tracking.
- `commands/` — matching Claude Code slash commands: `/wh-audit`, `/wh-report`, `/wh-launch`,
  `/wh-capi`.
- `assets/` with brand, platform, and client logos.

## [1.0.0] — 2026-07-11

### Added
- Initial public release of the Whathead MCP connection repository.
- README with product overview, supported platforms, safety model, and pricing.
- Machine-readable configs: `.mcp.json` and `server.json`.
- Per-client connection guides: Claude Code, Claude Desktop/Web, ChatGPT, Cursor,
  Codex CLI, Windsurf, Gemini CLI, and n8n / Manus automation.
- Platform coverage doc (`docs/platforms.md`), tool catalog (`docs/tools.md`), and safety
  model (`docs/safety.md`).
- `SECURITY.md`, `CONTRIBUTING.md`, issue templates, and a docs validator (`scripts/validate.sh`).
