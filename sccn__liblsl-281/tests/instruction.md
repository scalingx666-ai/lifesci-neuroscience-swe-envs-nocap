# Issue

**Title:** Fix lsl_get_channel_bytes to return 0 for cft_string as documented (extends #261)

## Description

Extends #261 by @myd7349. `lsl_get_channel_bytes` is documented to return 0 for the string type (`cft_string`), and the wire protocol already assumes this — `data_receiver.cpp` literally annotates the `Value-Size` header with `// 0 for strings`. In practice it was returning the (platform-dependent) `sizeof(std::string)` instead. This restores the documented contract.

## Why the abandoned endian test failure is expected, not a regression

@myd7349 paused this PR because the `tcpserver` string `endian` test failed. I traced it: the server's default `client_value_size` comes from `channel_bytes()`. With the fix it's 0 for strings, so the server no longer volunteers an endian conversion (`value_size > 1` is false) and advertises its own host byte order instead of echoing the client's `4321`.

This is **not** a data-path regression:
- The actual per-sample string serialization uses the separate `format_sizes[]` array in `sample.h` (unchanged here), so string length-prefixes are still byte-swapped when needed.
- The receiver independently re-derives whether to swap from the advertised `Byte-Order` header (`data_receiver.cpp`). The fix only shifts *which side* swaps the length-prefixes; all cross-endian / cross-version combinations remain correct.

## Changes

- @myd7349's one-line fix to `channel_bytes()`.
- Follow-up commit: update the `tcpserver` string `endian` subtest to assert the server advertises its host byte order (no reversal for strings). The float case (`tcpserver_float`) still covers actual binary endian conversion.

Verified locally on macOS: `lsl_test_internal` (310 assertions) and `lsl_test_exported` (724 assertions) all pass.

.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d4942fa8b3d5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.