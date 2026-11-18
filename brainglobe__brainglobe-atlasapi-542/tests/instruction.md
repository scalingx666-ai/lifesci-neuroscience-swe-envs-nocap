# Issue

**Title:** Update dependencies, add docstrings, fix url error handling

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
Addresses some of the issues () encountered while working on implementing tests for atlasgen ().

**What does this PR do?**
- Add `pooch` and `brainglobe-utils` to atlasgen dependencies ()
- Add docstrings to `annotation_utils.py`
- Add (back commented out) atlas_link url check and error handling

Note: After this PR is merged, `test_generate_metadata_dict_errors` `id="atlas_link=invalid"` should be ammended (see TODO note; #538).

## References

#541 #540 

## How has this PR been tested?
 and  failed checks can be ignored, tests covering the added code will been added when #538 is merged.

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

No.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d0c44ffa27b5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.