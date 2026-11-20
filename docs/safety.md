# Safety model

Whathead is built so that an AI assistant can operate live ad accounts **without** the risk
of an accidental spend change or deletion.

## The write protocol

1. **Dry run first on ad platforms.** Ad-platform mutating tools (`create_*`, `update_entities`,
   `set_entity_status`, `delete_entity`, `cross_platform_transfer`, …) run with
   `dry_run: true` unless you explicitly set it to `false`. A dry run returns exactly what
   *would* change, without changing anything. Google Tag Manager writes are the exception:
   they have no dry run, so they go through explicit confirmation and GTM workspace versions.
2. **Explicit confirm for destructive actions.** Deleting an entity, copying media between
   accounts, or publishing a campaign additionally requires `confirmed: true`. The assistant
   has to surface the change and get your "yes" first.
3. **Immutable-field guards.** Fields that a platform won't let you change after creation are
   blocked before the request is ever sent.
4. **Preflight validation.** For launches, the `*_launch_preflight` tools validate the whole
   campaign → ad set → creative → ad tree against each platform's objective, budget, creative,
   and asset rules — and tell you what's missing — before anything is created.

## Created paused

Campaigns created with `create_campaign` and entities copied with `cross_platform_transfer`
start **paused**. Going live is a separate, explicit `publish_campaign` / `set_entity_status`
step that you control. Native platform actions use the status you pass, so set it explicitly
(TikTok, for example, defaults new entities to enabled).

## Permissions

- Tools are gated by **OAuth scopes** (`read:campaigns`, `write:campaigns`, `read:reports`, …).
- **Connector tokens** for automation can be locked to a specific set of tools, platforms,
  and account IDs — so an n8n workflow can, for example, read reports but never write.

## Auditability

Every tool call is traced with a request ID and written to an audit log, so you always have a
record of what the assistant did, when, and on which account.

## What the assistant never sees

Your platform credentials. They are stored encrypted server-side and are never returned to
the client. The AI client works entirely through scoped, typed tools.
