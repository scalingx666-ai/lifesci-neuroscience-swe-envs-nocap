# Issue

**Title:** Reuse the MEF session across reads

## Description

#### What does this implement/fix?

`_read_segment_file` built a fresh `MefSession` on **every call**. Parsing the
session metadata takes ~38 ms on the 194-channel testing recording and does not
depend on the requested range, so a short window cost as much as reading the
whole file:

```
get_data(start=0, stop=100, picks=[one channel])  ->  39.0 ms
   of which  38.0 ms  read_mef_session_metadata
              0.02 ms actual data
```

This caches the session in `_raw_extras`, which `_ReadSegmentFileProtector`
already exposes to readers.

#### Numbers

Median of 3 interleaved process pairs against a pristine `main` worktree:

| request | main | this PR | |
|---|---|---|---|
| full read (194 ch x 98000) | 490.5 ms | 451.5 ms | 1.1x |
| 1000 samples, all channels | 47.2 ms | 7.2 ms | **6.6x** |
| 1000 samples, 4 channels | 39.7 ms | 0.19 ms | **206x** |
| 100 samples, 1 channel | 39.0 ms | 0.07 ms | **590x** |
| **100 epochs of 2 s** | **4895.6 ms** | **914.5 ms** | **5.4x** |

The epoching row is the one that matters in practice — every windowed read paid
the full metadata parse, so epoching, plotting and scrolling were all dominated
by it.

#### Safety

`MefSession` and `RawMef` are both picklable, so caching in `_raw_extras` does
not break `n_jobs`. Checked explicitly, all returning bit-identical data:

- `raw.copy()`, `copy.deepcopy(raw)`, `pickle` round-trip
- `crop()` after a cached read, `preload=True`, repeated reads
- `pytest mne/io/mef mne/io/tests`: 104 passed

#### What this does *not* fix

The remaining 451 ms of a full read is pymef decoding channel by channel
(`read_mef_ts_data`, 194 calls). **pymef does not release the GIL** — I measured
reading the channels across 4, 8 and 14 threads at 0.99x, and with per-thread
sessions it gets worse — so that floor cannot be moved from MNE.

#### Additional information

AI disclosure: I directed the work and reviewed and tested every change; Claude
Code (Claude Opus 5) profiled the reader, measured the GIL behaviour and the
pickling edge cases, and made the edits under my direction.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `982d7a03093b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.