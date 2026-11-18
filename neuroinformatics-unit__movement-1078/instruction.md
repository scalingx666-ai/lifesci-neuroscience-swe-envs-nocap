# Issue

**Title:** Save single-individual datasets to the given path in `to_dlc_file`

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

`_auto_split_individuals` returns True when a dataset has exactly one individual, which sends `to_dlc_file` into the branch that appends the individual's name to the file path. So `to_dlc_file(ds, "dataset.h5")` on a single-individual dataset wrote `dataset_id_0.h5` rather than `dataset.h5`. With one individual there is only one output file, so there is nothing to disambiguate and the path the caller gave should be used as is. The log line was wrong too, it reported the requested path even when the data went somewhere else.

**What does this PR do?**

Appends the individual's name only when more than one file is written, and logs the path that was actually used. `to_lp_file` picks this up as well, since it calls `to_dlc_file` with `split_individuals=True`. Behaviour for multi-individual datasets is unchanged. The Notes in both docstrings now say the name is appended only when the dataset holds more than one individual.

## References

## How has this PR been tested?

`pytest tests/test_unit/test_io/test_save_poses.py` and `pytest tests/test_integration tests/test_unit/test_io` pass locally. Three existing tests asserted the old file name for the single-individual fixture and were corrected, `test_to_dlc_file_split_individuals` now runs against the single-individual dataset as well, and there is a new test checking that a single-individual dataset lands at the given path and that no suffixed file is created. Six of these cases fail without the source change and pass with it. Multi-individual cases are covered by the same tests and still pass.

## Is this a breaking change?

Yes for anyone relying on the suffixed file name when exporting a single-individual dataset, though the issue treats that name as the bug.

## Does this PR require an update to the documentation?

Only the docstring Notes for `to_dlc_file` and `to_lp_file`, which are updated here. The user guide does not describe the file naming, so it needed no change.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8522a8c8bdfd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.