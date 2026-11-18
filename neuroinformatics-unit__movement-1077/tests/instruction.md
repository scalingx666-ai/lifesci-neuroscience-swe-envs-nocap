# Issue

**Title:** Fix `rolling_filter` returning an empty array when `window=1`

## Description

## Description

**What is this PR?**
- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
`rolling_filter` returns an empty array when called with `window=1`. The step that removes the padded edges slices with `slice(half_window, -half_window)`. For `window=1`, `half_window` is 0, and `-0` is also 0, so the slice becomes `slice(0, 0)` and every timepoint is dropped.

**What does this PR do?**
Computes the end index as `data_rolled.sizes["time"] - half_window`. This gives the same result for any window of 2 or more, so nothing changes there, and it no longer collapses when no padding was added.

## References

## How has this PR been tested?

Added `test_rolling_filter_window_1` to `TestFilteringValidDataset`, which checks that the time axis keeps its length and the values match the input. The class is already parametrized over the four pose and bbox fixtures, with and without NaNs. The test fails on `main` and passes with this change. `pytest tests/test_unit` passes locally, and `pre-commit` is clean.

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

No.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `15a1876b8656`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.