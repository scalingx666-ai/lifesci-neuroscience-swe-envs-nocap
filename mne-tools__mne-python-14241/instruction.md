# Issue

**Title:** Read BrainVision data in cache-sized blocks

## Description

#### Reference issue (if any)

None. Split out of #14237, which was too large to review as one change.

#### What does this implement/fix?

`_read_segments_file` read up to 100 MB of a binary file at a time. Letting a
caller pick a smaller budget, and having BrainVision ask for 8 MiB, keeps the
working set in cache.

Preloading a 101 MB `.eeg` (32 channels, 404 MB decoded, built by repeating the
`test.eeg` payload), warm page cache, min of 5 per process, 3 interleaved A/B
rounds against a pristine `main` worktree on the same machine:

| | main | this PR |
|---|---|---|
| BrainVision preload | 61.5 / 62.7 / 63.4 ms | 54.0 / 54.3 / 55.3 ms |

That is ~1.15x, and the rounds do not overlap.

The default stays `int(100e6)`, so the other eight callers of
`_read_segments_file` (EGI, Curry, Artemis123, Nicolet, Eximia, EEGLAB, FIL,
NSx) read exactly as before — only BrainVision opts in.

`block_size` is also floored at one complete channel frame. A budget smaller
than a frame would otherwise round it to zero and the read loop would not
advance.

#### Correctness

Output is bit-identical to `main` on all 13 BrainVision fixtures in the repo
plus the 101 MB file, compared with `np.array_equal`.

The new test reads the same file twice with very different block budgets and
asserts the data matches. Both budgets are deliberately *not* whole numbers of
channel frames, so a block size that stopped landing on frame boundaries is
caught; the sub-frame case pins the floor described above. Mutation-tested:
making blocks frame-unaligned and adding an off-by-one to the block size are
both caught.

#### Additional information

AI disclosure: I directed the work and reviewed and tested everything; Claude
Code (Claude Opus 5) made the code edits, built the benchmark fixture and ran
the A/B measurements under my direction.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `71850f67d18f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.