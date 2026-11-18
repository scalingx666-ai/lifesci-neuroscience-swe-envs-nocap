# Issue

**Title:** Read Artemis123, Curry, EEGLAB, Eximia, FIL and NSx in cache-sized blocks

## Description

#### Reference issue (if any)

, where a maintainer asked for the same treatment on other
formats. **Stacked on #14241** — that PR adds the `max_block_bytes=` parameter
this one uses, so please merge it first; this diff is only the per-reader opt-ins.

#### What does this implement/fix?

Six more readers ask `_read_segments_file()` for a cache-sized block instead of
the 100 MB default.

The size is measured per reader rather than copied from BrainVision, because the
optimum is not a fixed number of bytes — it tracks the number of time points per
block, so it moves with the channel count:

| reader | block | speedup | fixture |
|---|---|---|---|
| eximia | 2 MiB | 2.4x | 102 MB |
| nsx | 4 MiB | 2.3x | 102 MB |
| eeglab | 4 MiB | 2.1x | 102 MB |
| fil | 16 MiB | 1.9x | 197 MB |
| artemis123 | 16 MiB | 1.5x | 176 MB |
| curry | 16 MiB | 1.5x | 107 MB |

Each was swept (default / 32 / 16 / 8 / 4 / 2 / 1 MiB) with interleaved A/B
against a pristine `main` worktree, medians of repeated rounds.

#### Sizes were also chosen so that no shipped fixture regresses

This is the part worth reviewing. Copying BrainVision's 8 MiB everywhere would
have made real files **slower**: it measures 0.83x on Curry's 11.8 MB fixture
(10/10 rounds) and 0.81-0.85x on Artemis123's 17.6 MB one, because it splits a
read that otherwise fits in a single block. FIL is shipped at 16 MiB rather than
the faster 4 MiB for the same reason — 4 MiB is 2.5x on a large file but 0.96x
on the 9.8 MB fixture.

An in-process A/B that varies *only* the constant now shows every real fixture
within noise of the default: eximia 1.003, fil 1.001, curry 1.003,
artemis123 0.988.

#### Correctness

- Output bit-identical to `main`: 25/25 arrays compared with `np.array_equal`
  across every readable fixture of the six formats.
- `pytest mne/io/{eximia,nsx,fil,eeglab,artemis123,curry,brainvision} mne/_fiff`:
  305 passed.

#### Caveats a reviewer should weigh

- Measured on one macOS/Apple-Silicon machine, warm page cache. The mechanism is
  a CPU/cache effect in decode plus calibration, not disk I/O, so the numbers
  will move on other hardware — but the shape (large files gain, small files
  unaffected) should hold.
- No fixture in the testing dataset is large enough to exercise the changed path,
  so CI cannot demonstrate the win. Large fixtures were synthesised by tiling the
  shipped binaries (valid for these formats — sample counts come from file size,
  or from a sidecar that was patched to match).
- The per-reader constant may be the wrong shape long term. The EEGLAB sweep
  found the optimum tracks ~8192 time points per block, not a byte budget:
  reinterpreting the same bytes as 128 and 256 channels moved the peak. A
  `max_block_samples=` parameter would express this better. Happy to go that way
  instead if you prefer.

#### Additional information

AI disclosure: I directed the work and reviewed and tested everything; Claude
Code (Claude Opus 5) ran the per-reader sweeps and bit-exactness checks and made
the edits under my direction.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `03e4240874d7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.