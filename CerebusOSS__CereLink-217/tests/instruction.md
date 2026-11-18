# Issue

**Title:** Put out-of-order sample datagrams back in order

## Description

Stacked on #215 (base: `feat/native-default-central-deprecated`). .

## Problem

About once a minute, sample timestamps step backwards by ~29 samples at 30 kHz. Nothing is lost; two datagrams arrive in the wrong order. Central sees exactly the same reordering, and it happens with or without Central running.

**Cause, as seen on the wire:** the device normally sends one datagram per millisecond of samples. Its protocol-monitor packet goes out in a datagram of its own about every 1.111 s (33,333 sample periods). When that falls partway through a millisecond, the millisecond's samples are split around it: e.g. 27 samples, then the monitor, then the remaining 3 samples a few microseconds later.

The monitor interval isn't a whole number of milliseconds (33,333 = 30 × 1111 + 3 sample periods), so the split point moves by 3 samples each time and the pattern repeats every 10 monitors, i.e. every **11.11 s**. The 27 + 3 split, a 3-sample datagram ~3 µs behind a 27-sample one, is the one Windows occasionally delivers tail-first, although an Npcap capture shows the wire order is correct. Reported to Blackrock so a future firmware release can avoid the split.

**Host-side settings didn't help:**
- interrupt moderation off;
- Defender `DisableDatagramProcessing` (its `windefend_datagram_v4` WFP callout stays installed regardless);
- running without Central.

This adapter (Realtek 2.5GbE, Microsoft inbox driver) has no RSS.

## Fix

`cbdev::SampleReorderBuffer` (new `src/cbdev/src/sample_reorder.h`) sits between `receivePackets()` and callback dispatch in cbdev's receive thread.

- **Hold rule:** a datagram is held only if, for some sample group it carries, its first sample comes **after a gap** *and* it **spans under 0.5 ms** — i.e. it's the tail of a split whose head hasn't arrived.
- **Release:** the split puts out head, monitor, tail, so with the tail first its head is at most two datagrams behind it.
  - **Late head arrives within 2 datagrams:** the head is delivered first, then the tail, then anything that queued behind it. Only the late head ever moves.
  - **Otherwise:** after `ConnectionParams::reorder_window` (default 2; 0 disables) more datagrams, everything is released in arrival order; the gap was real loss.
  - **Idle socket:** the receive timeout (blocking sockets) also releases.
  - No timer or `select()`: holds are bounded by datagram count, so a lost head can never hold data longer than the window.
- **Unaffected cases:**
  - In-order traffic is never held.
  - Genuine loss is normally followed by a full millisecond datagram, which isn't held.
  - Each sample group is tracked separately. Every channel picks its own group, so any of groups 1–6 can be active at once at different rates; only groups at 10 kHz and up can mark a tail. Cross-group skew is ignored.
  - Spike and config packets never trigger a hold. Spikes inside a reordered datagram are restored along with it.
- **Reporting:** restorations are reported on stderr, rate-limited like cbdev's packet-loss lines. `CERELINK_REORDER_STATS=1` prints a per-session summary: datagrams, holds, what ended each hold (head / count / idle), and the most datagrams a late head arrived after its tail.

## Measurements (HUB1, 8 ch × 30 kHz)

- **Correctness:** over 10 minutes with the fix, 0 reorders reached the application, and cbdev reported 3 restorations. Without the fix, the same run shows 6–11 reorders per 10 minutes.
- **Hold rate (Release, 8 × 60 s runs):** 6 holds in ~496,000 datagrams (about 1 in 83,000). Every one was ended by the late head, 23–27 µs later. None ended by timeout or by real loss.
- **CPU, microbenchmark (`-O2`):** 0.2–0.5 µs per datagram, ~0.02–0.05% of a core per device at 1,000 datagrams/s. The 256-channel figure is with cold-cache synthetic data.
- **CPU, end to end:** Release `simple_device`, 8 alternating A/B rounds: 1.88% vs 2.13% of a core. The paired 95% CI is −0.07 to +0.56 points, i.e. not separable from noise.

## Tests

- **New:** 15 `SampleReorder.*` unit tests (synthetic datagrams). They cover:
  - the bench case, and a head two datagrams behind its tail;
  - sample-free datagrams queued behind a held tail;
  - real gaps after full datagrams, and after small ones (released after the window);
  - idle-socket release;
  - detection in either of two groups, and all six groups active at once;
  - cross-group skew;
  - interleaved spikes;
  - timestamp resets;
  - disabling the buffer, and padding of held copies.
- **Full suite:** MinGW Debug on Windows, ctest 523/523 run serially, including the 94 nPlayServer integration tests (before the count-based rework).

The measurements above were taken with the earlier time-based (3 ms) hold. Every hold then ended by the late head 23–27 µs after the tail, well before the next millisecond's datagram, which the count-based rule also covers. The count-based version has not been re-measured on Windows.

**Not covered:** a spike-only configuration (no sample group enabled). The monitor still splits datagrams there, but the detector needs sample timestamps.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `882af12c9abe`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.