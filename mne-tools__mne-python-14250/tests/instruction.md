# Issue

**Title:** Read EGI simple-binary event channels in blocks

## Description

#### What does this implement/fix?

`_read_events()` walks a simple-binary EGI file **one time sample at a time**:
for every sample it seeks past the data channels and issues a separate
`np.fromfile` for that sample's event values. Opening a file therefore costs two
Python-level I/O calls per sample.

Samples are stored as interleaved frames — `n_channels` data values followed by
`n_events` event values — so the same bytes can be read a few MB at a time and
the event rows sliced out. Same reads, ~4000x fewer calls.

#### Numbers

Median of 5 interleaved process pairs against a pristine `main` worktree:

| file | main | this PR | |
|---|---|---|---|
| 32 MB, 30800 samples, 256 ch | 170.3 ms | 10.8 ms | **15.7x** |
| shipped `test_egi.raw` (79 KB) | 1.96 ms | 1.53 ms | 1.28x |

Beforehand `cProfile` put `_read_events` at **89% of `read_raw_egi`** (0.194 s of
0.219 s, 30821 `np.fromfile` calls). The cost is linear in recording length, so
it grows with the file — the fixture above is only ~2 minutes of data.

#### Correctness

- Bit-identical to `main`: data arrays **and annotations** compared with
  `np.array_equal` (the annotations matter here — they are built from exactly
  these event channels).
- Memory stays bounded: the loop reads 4 MiB at a time rather than slurping the
  whole recording, so the seeks are not traded for a large allocation.
- `pytest mne/io/egi`: 26 passed.

#### Caveats

No fixture in the testing dataset is long enough to show this, so CI cannot
demonstrate it. The large file was synthesised by tiling the shipped fixture's
data section and patching `n_samples` in the header; I verified the header
layout matches the file exactly before tiling.

#### Additional information

AI disclosure: I directed the work and reviewed and tested every change; Claude
Code (Claude Opus 5) profiled the reader, ran the A/B measurements and made the
edits under my direction.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3e783e64dddb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.