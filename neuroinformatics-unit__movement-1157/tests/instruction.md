# Issue

**Title:** Fix NaN warning for single-track data in path metrics

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

`compute_path_length` (and the other path metrics that share `_warn_about_nan_proportion`) fails on data with only `time` and `space` dimensions when some points are NaN. Building the warning stacks over an empty list of track dimensions, which raises `Must pass non-zero number of levels/codes`.

**What does this PR do?**

When there are no track dimensions to stack, the warning reports on the whole array. The user gets the NaN warning and a result, as with multi-track data.

## References

## How has this PR been tested?

- Added `test_path_length_nan_warning_single_track`, which fails before this change.
- `tests/test_unit/test_kinematics` passes (230 tests).

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `086313ea9716`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.