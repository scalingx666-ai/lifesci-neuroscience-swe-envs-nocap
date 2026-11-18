# Issue

**Title:** Decode Persyst and Nihon Kohden data in cache-sized blocks

## Description

#### What does this implement/fix?

Two readers materialise the entire requested range before calibrating it, so
every intermediate is as large as the request and none of it stays in cache.

**Persyst** had a hand-rolled copy of `_read_segments_file()` plus one extra
full-size temporary: `np.reshape(record, (n_chs, -1), order="F").astype(np.float32)`.
`_mult_cal_one()` already casts, so that `.astype` was a whole-array copy for
nothing. The method is now a call to the shared helper — a net deletion.

**Nihon Kohden** reads the whole request and then builds four full-size
temporaries over it (`+ 0x8000`, `.astype(int16)`, `* cal` to float64, `+=`/`*=`).
Same work, now a block at a time.

#### Numbers

Median of 5 interleaved process pairs against a pristine `main` worktree:

| case | main | this PR | |
|---|---|---|---|
| Persyst, 107 MB | 88.7 ms | 39.3 ms | **2.26x** |
| Nihon, 106 MB | 267.6 ms | 147.7 ms | **1.81x** |
| Persyst shipped fixture | 0.12 ms | 0.12 ms | 1.05x |
| Nihon shipped fixture | 0.362 ms | 0.364 ms | 0.995x |

Persyst's gain splits cleanly: **1.32x** from dropping the redundant `.astype`
alone (shared helper at its 100 MB default), the rest from the smaller block.

The Nihon shipped-fixture figure is a median of 8 runs x 200 reps — at 0.36 ms a
single-shot comparison is pure noise (an early 7-rep run read 0.86x). That file
is 5800 samples and fits in one 1 MiB block, so it keeps its current code path
exactly.

#### Why the two constants differ

The optimum tracks time points per block, not bytes. Nihon has 25 channels and
builds four temporaries per block; its sweep improves monotonically down to
~256 KiB before falling off a cliff at 64 KiB, so 1 MiB is chosen for margin.
Persyst sits at 16 MiB. This is the same concern I raised on #14246 — a
`max_block_samples=` parameter would express it better than a per-reader byte
budget, and I am happy to go that way instead.

#### One behaviour change worth flagging

Dropping Persyst's `.astype(np.float32)` changes results for a 32-bit `.dat`
whose raw counts exceed `2**24`, where float32 was silently rounding them. That
is a precision fix rather than a regression, and 16-bit files (and the shipped
32-bit fixture, whose counts are well inside the range) are unaffected.

#### Correctness

- Bit-identical to `main` across every readable Persyst and Nihon Kohden
  fixture, including the synthesised large ones (`np.array_equal`, data and
  annotations).
- `pytest mne/io/persyst mne/io/nihon mne/_fiff`: 164 passed.

Large files were synthesised by tiling — Persyst derives its sample count from
the `.dat` file size, and Nihon's single data block was tiled with
`record_duration` patched. No shipped fixture is big enough to show the effect,
so CI cannot demonstrate it.

#### Additional information

AI disclosure: I directed the work and reviewed and tested every change; Claude
Code (Claude Opus 5) profiled the readers, ran the A/B measurements and made the
edits under my direction.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3e783e64dddb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.