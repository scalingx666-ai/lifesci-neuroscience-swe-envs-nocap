# Issue

**Title:** Read KIT data in cache-sized blocks

## Description

#### What does this implement/fix?

The reader asked for up to 100 MB per block, then cast the whole block to
float64 and scaled it in place (`.astype(float)` then `block *= conv_factor`), so
the working set ran to several hundred MB and none of it stayed in cache.

Same treatment as #14241 and #14246.

#### Numbers

Median of 5 interleaved process pairs against a pristine `main` worktree:

| file | main | this PR | |
|---|---|---|---|
| 136 MB (161 ch x 425000) | 258.5 ms | 145.6 ms | **1.78x** |

A sweep puts the optimum at 2 MiB — 32 MiB is only 1.14x, 8 MiB 1.38x,
4 MiB 1.66x, 1 MiB 1.60x.

No shipped fixture regresses, and two improve because they were already being
split differently:

| fixture | main | this PR | |
|---|---|---|---|
| `ArtificalSignalData_Yokogawa_1khz.con` | 2.87 ms | 2.26 ms | 1.27x |
| `ArtificalSignalData_RICOH_1khz.con` | 3.06 ms | 2.77 ms | 1.10x |
| `Example_PQA160C_1001-export.con` | 1.05 ms | 1.07 ms | 0.99x |
| `010409_Motor_task_coregist-export.con` | 1.22 ms | 1.24 ms | 0.98x |

#### Correctness

- Output bit-identical to `main` on every readable KIT fixture (`np.array_equal`).
- `pytest mne/io/kit`: 15 passed.

#### Caveats

The constant differs from the other readers (2 MiB here, 8 MiB BrainVision,
2–16 MiB in #14246) because the optimum tracks time points per block, so it
moves with the channel count. As on #14246, I think a `max_block_samples=`
parameter would express this better than a per-reader byte budget, and I am
happy to go that way instead.

No fixture in the testing dataset is large enough to show the effect, so CI
cannot demonstrate it. The large file was synthesised by tiling the raw-data
section of `data_berlin.con` — verified to be the last section in the file — and
patching `n_samples` in the acquisition header.

#### Additional information

AI disclosure: I directed the work and reviewed and tested every change; Claude
Code (Claude Opus 5) ran the block-size sweep and the A/B measurements and made
the edits under my direction.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `982d7a03093b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.