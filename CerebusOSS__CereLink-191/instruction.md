# Issue

**Title:** Pace configuration-packet sends to avoid device UDP buffer overrun

## Description

## Problem

Configuring a device via Orion (Observatory) failed on a Gemini Hub running firmware **7.7.0** with repeated `Response timeout` on the runlevel sync barrier, and channel configuration never completed:

```
[CereLink] Clear-config sync failed: Response timeout   (×5)
[CereLink] Timed out waiting to confirm cleared channel configuration
[CereLink] Channel configuration failed
```

## Root cause (verified on real Hub1 hardware)

Not a protocol issue — the Hub negotiates protocol 4.1. Orion's clear-config phase sends **one `setChannelConfig()` per channel** (272 channels × 2 = ~544 UDP datagrams) back-to-back with no pacing, then calls `sync()`. That burst overruns the device's small UDP receive buffer (~8 CHANINFO packets — the exact limit `DeviceSession::sendPackets()` already documents), dropping packets including the runlevel sync barrier, so `sync()` times out.

Newer firmware drains fast enough to survive the burst, which is why this looked like a 7.7.0 backward-compat regression.

**Reproduced and fixed on hardware:** unpaced → times out every retry; with pacing → clear-config + sync succeeds on the first attempt (3/3 runs).

## Fix

`DeviceSession::sendPacket()` enforces a 200 µs minimum gap between consecutive **configuration-channel** sends (`chid & cbPKTCHAN_CONFIGURATION`). Data/streaming packets and isolated config sends (gap already elapsed) incur no delay. This extends the pacing that `sendPackets()` already does for its own batches to the per-packet path that callers use — so it protects every caller with no change required in Orion.

## Testing

- New unit test `ConfigSends_ArePaced_DataSends_AreNot` — uses `sleep_for`'s guaranteed-minimum semantics, so the timing assertion cannot be flaky.
- New `examples/ClearConfigRepro/clear_config_repro.cpp` reproduces the failure against real hardware (`clear_config_repro HUB1`, env `PACE=<n>` to compare).
- Full build + `cbdev_device_tests` / `cbdev_tests` / `cbsdk_tests` pass. (`ConnectionParams_Predefined_NPlay` fails on `master` too — pre-existing, unrelated.)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cd00f9b33428`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.