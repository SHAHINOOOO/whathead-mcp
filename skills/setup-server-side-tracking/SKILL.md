---
name: setup-server-side-tracking
description: Stand up server-side conversions (Signal CAPI) for Meta, Snapchat, or TikTok with Whathead, validate an event, and route it. Use when the user asks about CAPI, Conversions API, server-side tracking, or first-party events.
---

# Set up server-side tracking (Signal CAPI)

Use the **Whathead** MCP Signal tools to configure server-side conversions.

## Steps

1. **Inventory.** Call `signal_get_sites` and `signal_get_destinations` to see what exists.
2. **Create the destination.** Use `signal_capi_setup_meta` / `_snap` / `_tiktok` with the
   pixel/dataset ID and access token (the user provides these; they are stored encrypted).
3. **Validate.** Use `signal_capi_validate_event` on a sample event to check required fields,
   match keys, and dedup — before sending anything live.
4. **Test.** Use `signal_capi_test_event` (dry-run / test event) and confirm it is received.
5. **Route.** Wire the canonical events to the destination and verify with
   `signal_capi_get_delivery_attempts` and `signal_capi_get_quality`.

## Guardrails
- Treat tokens as secrets — never echo them back in plain text.
- Validate before routing; check delivery quality after.
