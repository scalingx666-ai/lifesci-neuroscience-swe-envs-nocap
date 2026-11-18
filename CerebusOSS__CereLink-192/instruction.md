# Issue

**Title:** Translate outbound config packets for legacy-protocol devices

## Description

## Summary

Two latent bugs prevent protocol **4.0** and **3.11** devices from being configured. They're independent of the firmware-7.7.0 pacing fix (#191, released in v9.12.1) — that issue turned out to be UDP-buffer overrun on a 4.1 Hub, not translation. These fixes matter when actually talking to 4.0/3.11 hardware, where the config path currently sends unparseable packets.

## Bug 1 — config helpers bypass protocol translation

The protocol wrappers (`DeviceSession_311/400/410`) wrap a `DeviceSession` by **composition** and delegate the high-level config helpers (`setChannelConfig`, `setSystemRunLevelSync`, `setSampleGroup`, …) straight to the wrapped session. Those helpers call `sendPacket()` internally — but on the *wrapped* `DeviceSession`, whose `sendPacket()` did **not** translate. Only the wrapper's own `sendPacket()` override translated, and the delegated helpers never reached it. So on a legacy device every config packet went out in current (4.1+) wire format, the device couldn't parse it, and the sync barrier timed out.

**Fix:** centralize outbound translation in `DeviceSession::sendPacket()`, keyed by a send protocol the wrappers set via `setSendProtocol()` at construction. Wrappers now delegate `sendPacket()` to the wrapped session instead of each duplicating translation, so every send path — direct or via a delegated helper — is translated in exactly one place. Removes the three per-wrapper `sendPacket` overrides.

## Bug 2 — `cbPKT_HEADER_400` not byte-packed

`cbPKT_HEADER_400` in `packet_translator.h` lacked `#pragma pack(1)`, so `sizeof` was **24, not 16** (dlen landed at offset 12 instead of 11), corrupting every translated 4.0 packet. Added packing and `static_assert`s pinning the 3.11 (8-byte) and 4.0 (16-byte) header sizes. A unit test surfaced this.

## Testing

- New `LegacyConfigHelper_TranslatesOutbound_311` / `_400` tests drive a *delegated* config helper (not `sendPacket()` directly) and assert the on-wire legacy header layout — they fail before the fix (packets arrive current-format).
- Full build + `cbdev_device_tests` / `cbproto_tests` / `cbsdk_tests` pass. (`ConnectionParams_Predefined_NPlay` fails on `master` too — pre-existing, unrelated.)

Rebased on `master` after v9.12.1, so this is a clean, translation-only diff.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `449264775ec9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.