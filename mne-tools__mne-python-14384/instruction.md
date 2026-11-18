# Issue

**Title:** PERF: Optimize time slicing order in Epochs.get_data()

## Description

#### reference issue

related to #11899.

#### what does this implement/fix?

in `Epochs.get_data()`, fancy indexing (`data[select][:, picks]`) ran before the time slice, so it copied the full time axis for every selected epoch and channel, then threw most of it away.

this pr flips the order:

- slice time first (`data[..., start:stop]`), which is a free view on preloaded data
- then apply `select` and `picks` on that view, so only the needed time points get allocated
- build `use_idx` later in `_get_data`, so it's skipped when data is already preloaded

#### benchmark

100 epochs, 64 channels, 10,000 timepoints, asking for 100 timepoints with channel and epoch selection: 0.2183 s before, 0.0004 s after (~489x faster).

#### additional information

- added `test_get_data_time_slice_order` (picks, item, units, `copy=True/False`, preloaded vs disk-loaded)
- all tests in `test_epochs.py` pass
- ai disclosure: i found the indexing-order issue and checked the changes myself. an ai assistant (google antigravity) helped draft the benchmark snippet and some test edge cases.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `614fb79c5c72`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.