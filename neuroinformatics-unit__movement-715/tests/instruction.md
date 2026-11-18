# Issue

**Title:** Refactor DeepLabCut CSV read and validation

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**


**What does this PR do?**
- updates the logic to compare only the non-numeric levels in ValidDeepLabCutCSV
- stores the read column levels in the ValidDeepLabCutCSV object for use in [` _df_from_dlc_csv`](https://github.com/neuroinformatics-unit/movement/blob/d5544d9aeb1fd7cf2d59be2f78c648548ca41b0c/movement/io/load_poses.py#L640C5-L640C21) 
- simplifies read_csv call (note that there is a much simpler way to do this for typical cases as mentioned in #716, but this approach is one that "works-for-all"; the other alternative would be to have two pathways: use read_csv with index_col=0 if the first row is not empty, otherwise use read_csv without index_col and set/reset the MultiIndex/index names after).

## References
#716

## How has this PR been tested?
Existing tests passing

## Is this a breaking change?
No

## Does this PR require an update to the documentation?
No

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d5544d9aeb1f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.