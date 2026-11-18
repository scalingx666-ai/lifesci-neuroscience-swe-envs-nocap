# Issue

**Title:** Refactor dataset validators

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
 #210 

**What does this PR do?**
- Reorganises the datasets validators (ValidPosesInputs, ValidBboxesInputs) to subclass from  _BaseDatasetInputs
- Rewrites the relevant tests to reduce duplication - what have been tested in the parent class are not repeated in the subclasses
- Enforces uniqueness in keypoint_names, individual_names supplied (in addition to length check)
- Replaces hardcoded index numbers (e.g. fragile assumption that -1 refers to the individuals dim) by inferring based on DIM_NAMES
- Renames dataset validator classes to better reflect what they actually are (input validators, but not datasets) 
- Moves `_ds_from_valid_data` into the input validator classes as `to_dataset` for converting validated inputs into xr.Datasets
 
## References
#241, #210 part of #667

## How has this PR been tested?
Unit tests have been rewritten

## Is this a breaking change?
Yes, the Validators have been renamed to ValidPosesInputs and ValidBboxesInputs

## Does this PR require an update to the documentation?
Not until #722 is finalised

## Checklist:
- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `96c28a7775d8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.