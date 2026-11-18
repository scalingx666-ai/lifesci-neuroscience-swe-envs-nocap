# Issue

**Title:** Fix CLIENT-mode runlevel/sync and rec ring buffer wrap

## Description

## Summary
Three independent bugs that combined to make CLIENT-mode sessions unreliable on long-running streams. Each is fixable in isolation; together they make `pycbsdk` and `simple_device` produce correct runlevel, working `sync()`, and clean packet streams across rec ring buffer wraps.

## Bugs and fixes

### 1. `getRunLevel()` returned 0 in CLIENT mode
**Symptom:** `pycbsdk/examples/session_info.py NPLAY` (and `client_session.runlevel` in user code) reported `0` even though the device was running. `simple_device NPLAY` attached as CLIENT showed `Runlevel: 0 (UNKNOWN)`.

**Cause:** `SdkSession::getRunLevel()` only read the per-session `device_runlevel` atomic, which is updated by the receive thread when a SYSREP packet flows through that session's receive ring. Devices only emit SYSREP in response to runlevel-set commands, so once the STANDALONE owner finished its handshake, no further SYSREPs flowed and CLIENT-side `device_runlevel` stayed at 0 indefinitely.

**Fix:** `getRunLevel()` falls back to `getSysInfo()->runlevel` (the SYSINFO mirror in shmem that the STANDALONE owner writes via `setSysInfo()` on every received SYSREP).

### 2. CLIENT-mode `sync()` raced with SYSREP heartbeats
**Symptom:** `sync()` could return before the device had actually processed prior config packets, so subsequent read-back saw stale state. Worse: it sent SYSSETRUNLEV with `runlevel=0` (stale atomic), which can perturb device state.

**Cause:**
- `sync()` read `device_runlevel.load()` directly for the "no-op" runlevel set. In CLIENT mode that's still 0.
- `sync()` waited on any 0x10..0x1F SYSREP via the boolean `received_sysrep` flag. Periodic SYSREP (0x10) heartbeats from nPlayServer satisfied the wait before the actual SYSREPRUNLEV (0x12) reply arrived.

**Fix:**
- `sync()` uses `getRunLevel()` (with the new shmem fallback) for `current`.
- New sticky `received_sysrepRunlev` flag in `Impl`, set only when the receive thread sees a 0x12 packet. `setSystemRunLevel` resets it before send. `waitForSysrep` accepts an optional `expected_type` argument; CLIENT-path `sync()` passes `cbPKTTYPE_SYSREPRUNLEV`. Sticky semantics are race-free against later 0x10 heartbeats arriving before the waiter wakes.

### 3. Rec ring buffer wrap left an unmarked gap
**Symptom:** ~6–17 s into any CLIENT session, the receive thread started decoding garbage as fake SYSREP-family packets, firing a flood of `[runlevel change]` events with nonsense runlevels and inflating delivered-packet counts. Once misaligned, the reader stayed misaligned for the rest of the session.

**Cause:** When the writer would not fit the next packet at `head`, it wrapped to offset 0 and incremented `head_wrap` — but left a 1+ dword gap between the previous packet's end and `buflen` with no marker. The reader had no way to know about this gap, so it tried to read a "packet" from inside it, got garbage `dlen`, advanced `tail` by some incorrect amount, and stayed off-aligned thereafter.

**Fix:**
- `writeToReceiveBuffer` pads the gap with a synthetic wrap-marker packet (`chid=0, type=0, dlen != 0` — a combination no real packet uses). The marker fills the gap exactly so the reader can step over it cleanly. Wrap policy also avoids leaving 1..3-dword gaps that can't fit a marker header.
- `readReceiveBuffer` recognizes the marker and silently advances `tailindex` past it without delivering the marker to user callbacks.
- Adds `__atomic_store_n(..., __ATOMIC_RELEASE)` on `head_index` and `__atomic_load_n(..., __ATOMIC_ACQUIRE)` on the reader side so packet bytes are guaranteed visible before the consumer sees the new head index. Required for correctness on ARM/Apple Silicon weak memory.

## Diagnostics path
The garbage runlevel symptom drove the investigation. A debug print added to `readReceiveBuffer` caught the first misaligned read and showed `tailindex=1 tailwrap=1` immediately after the first wrap — confirming the reader landed 1 dword off zero, not at offset 0. Tracing the writer revealed the unmarked gap.

## Backward compatibility
- The wrap-marker packet uses `chid=0, type=0, dlen != 0`. No real packet uses this combination (heartbeats have `chid=cbPKTCHAN_CONFIGURATION=0x8000`; group sample packets have `chid=0` with `type` in 1..6).
- Old readers running against a new writer will see the marker as a normal packet (chid=0, type=0) — they'll deliver it to user callbacks but otherwise function. Slight behavior change for old readers, not breaking.
- New readers running against an old writer (no padding) get the same misalignment behavior as before — no regression, just no improvement.
- Pad-marker can therefore be deployed incrementally; both processes need the new code for the bug to be fully fixed end-to-end.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1991c9386055`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.