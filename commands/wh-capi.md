---
description: Set up server-side conversions (Signal CAPI) with Whathead
---
Using the Whathead MCP Signal tools, set up server-side tracking for: $ARGUMENTS

1. `signal_get_sites` and `signal_get_destinations` to see current state.
2. Create the destination with `signal_capi_setup_meta` / `_snap` / `_tiktok` (I'll provide
   the pixel/dataset ID and token; treat tokens as secrets).
3. `signal_capi_validate_event` on a sample event before sending anything.
4. `signal_capi_test_event` to confirm receipt.
5. Route the events, then verify with `signal_capi_get_delivery_attempts` and
   `signal_capi_get_quality`.
