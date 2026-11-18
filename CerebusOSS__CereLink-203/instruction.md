# Issue

**Title:** Fix CLIENT-mode abort on macOS and guard the native shmem layout

## Description

A pycbsdk 9.13.0 pipeline aborted on macOS almost immediately; reverting to 9.12.1 cleared it. The crash report puts the fault on the CLIENT shared-memory receive thread:

```
SdkSession::start()::$_5                     <- shmem_receive_thread
cbdev::ClockSync::addDataPacketSample(...)
std::__1::mutex::lock()
std::__1::__throw_system_error(int, char const*)
abort
```

`pthread_mutex_lock` returns `EINVAL` when the mutex has been destroyed or overwritten. glibc does not validate the signature, so the same defect is silent on Linux — which is why Windows-only testing before the release missed it.

## Commit 1 — the abort

`SdkSession::stop()` gated every thread join on `is_running`. `start()` sets that flag **last**, after the receive thread is already live (line 379 vs. 561), and `stop()` clears it first. Teardown anywhere in that window — including the `create()` error path that destroys a half-started session — skipped the joins, and `~Impl` then freed `client_clock_sync` under the running thread. Gating on the `Impl` instead is correct and idempotent, since each join is already guarded by its own thread's flag.

Two further defects, both new in 9.13.0, reach the same mutex:

- **Unclamped channel window.** `procinfo.chancount` comes off the wire and can exceed the compile-time `cbMAXCHANS` that sizes `channel_type_cache` — a `std::array` declared ahead of `client_clock_sync` in the same `Impl`. Reproduced deterministically by the new test under libc++ hardening: `array<ChannelType, 284ul>::operator[](__n=284)` from `rebuildChannelTypeCache`.
- **Unsynchronised window rebuild.** `ensureWindowResolved()` refills `chan_segs` from whichever thread calls a channel accessor, while the receive thread iterates it per packet. pycbsdk 9.13.0 made this far likelier by calling `max_chans()` inside `get_channel_field()`. Now under a mutex taken once per batch, with `local_max_chans` atomic so per-packet dispatch stays lock-free.

## Commit 2 — the trigger

The reporting setup has a separate service still on CereLink 9.12 owning the shared memory, with the 9.13 pipeline attaching as a CLIENT. 9.13 changed `NativeConfigBuffer` (dropped `optiontable`/`colortable`, added `segment_uid`) and nothing checked: `cfg->version` was written by the owner and never read. Measured by compiling both headers:

| `offsetof` | 9.12.1 | 9.13.0 |
|---|---|---|
| `procinfo` | 52 | 52 |
| `fileinfo` | 1,035,796 | 1,035,796 |
| `clock_offset_ns` | 1,037,108 | **1,036,596** |
| `owner_pid` | 1,037,132 | **1,036,620** |

Everything through `fileinfo` keeps its offset, so `procinfo`/`chaninfo` survive; everything after shifts 512 bytes, so clock sync, the liveness check and the new supersession check all run on arbitrary bytes. Nothing fails outright — that is the problem.

Adds `NATIVE_CONFIG_LAYOUT_VERSION` in the high 8 bits of the version field the owner already writes (pre-9.13 builds read back as layout 0), and tags the resulting error so `create()` does **not** fall through to its STANDALONE fallback — that path `shm_unlink`s and recreates the segments, which would take the device away from a live owner that is merely a different revision.

## Verification

- 408/408 C++ tests pass. Run ctest **serially**; `-j4` trips pre-existing shmem-name collisions between parallel tests, unrelated to this branch.
- 161 passed / 3 skipped in the pycbsdk suite against a dylib built from this branch.
- Mixed-version repro (pycbsdk 9.12.1 STANDALONE owner on nPlay + 9.13.0 CLIENT): previously attached and streamed on garbage metadata; now refuses with `Incompatible shared memory layout: the owner wrote config layout 0 (protocol 4.2), but this build requires layout 2. ...`, and the owner keeps streaming through the refusal.
- Same-version owner/client pair still streams normally.

## Notes for review

- The `stop()` fix is timing-dependent and has no deterministic regression test; the suites are the only cover. Worth confirming against the real service before cutting 9.13.1.
- ASan is unusable on macOS 26 — its runtime deadlocks in its own initialisation. `-D_LIBCPP_HARDENING_MODE=_LIBCPP_HARDENING_MODE_DEBUG` was used instead and caught the array overrun directly.
- Consumers pinning `pycbsdk>=9.13.0` will now hard-fail against a 9.12 owner rather than running on bad data. That is the intended behaviour, but it means the owning service has to be updated in lockstep.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `933ecd40d4eb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.