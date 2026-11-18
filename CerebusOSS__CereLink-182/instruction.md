# Issue

**Title:** Config setter ergonomics: auto-sync, n_configured, clear_channel_map, async runlevel

## Description

## Summary

 (with side fix to a CHANSETSPKTHR bug); . (#180 was already covered by `register_config_callback` and is closed.)

Four commits, in order:

- **2708ca6** — Per-channel CHANSET setters get an `auto_sync` opt-in. The 9 broadly-scoped setters now take a trailing `int auto_sync` (C-API) / `auto_sync: bool = False` (pycbsdk) flag; when true they run `sync()` first so the local cache reflects in-flight CHANREPs before the read-modify-write. `set_channel_spkthrlevel` stays narrow. Bundles two firmware-mismatch bug fixes: `set_channel_spkopts` and `set_channel_spike_sorting` were emitting `CHANSETSPKTHR`, which the firmware ignores `spkopts` on — switched to `CHANSETSPK`.
- **d0072c0** — Bulk by-type setters self-sync (top + bottom) and return `n_configured` post-sync; `chans=None` (`UINT32_MAX` in C) means "all matching". Always sends to every in-scope channel — no skip-if-already-correct, since a dropped CHANREP could leave the local cache stuck against a concurrent change. Includes the matching CHANSETSPKTHR→CHANSET fix in DeviceSession (STANDALONE path).
- **89d08e0** — `clear_channel_map()` to undo `load_channel_map()`. Drops the local position+label overlay and pushes default `chan{N}` labels to the device.
- **32dde5a** — `registerRunlevelChangeCallback` in C++/C-API + `async session.wait_until_running()` / `await session.wait_for_runlevel(level)` in pycbsdk. Resolves once the device-reported runlevel reaches the target; thread-bridged via `loop.call_soon_threadsafe`. Returns immediately if already past target.

## Test plan

- [x] All 192 non-device C++ unit tests pass (`ctest -E '^(device\.|integration\.)'`)
- [x] All 145 pycbsdk tests pass against nplay (135 prior + 10 new in `TestNConfigured`, `TestWaitUntilRunning`, and 3 new `clear_channel_map` cases in `TestCMP`)
- [x] Hardware-dependent C++ integration tests (`device.*`, `integration.*`) — not run locally; needs an NSP/HUB or nplay-on-CI
- [x] Smoke-test in ezmsg-blackrock against the new `await session.wait_until_running()` and `set_sample_group(chans=None)` shape

## Breaking API changes

C-API and pycbsdk both:
- Per-channel setters: trailing `auto_sync` parameter (callers must pass `0`/`False` to keep prior behavior).
- Bulk by-type setters (`set_sample_group`, `set_ac_input_coupling`, `set_spike_sorting`, `set_spike_extraction`): signature change — `n_chans` becomes `chans` accepting `int | None`, return type changes from result-only to `int` (n_configured).

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `398d813864d6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.