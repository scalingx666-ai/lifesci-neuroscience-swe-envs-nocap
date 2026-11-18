# Issue

**Title:** Add fields for setting voxel size during curation

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

Currently there's no way to set the data's voxel sizes during training data curation, instead it's hard-coded. But we need to be able to set it specifically to the dataset.

**What does this PR do?**

It adds fields to be able to specify the 3-dim voxel sizes.

## References

None.

## How has this PR been tested?

Added a test, but also I used it as part of the original caching PR when curating my own dataset.

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

No.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `13274b07b65b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.