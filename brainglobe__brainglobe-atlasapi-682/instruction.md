# Issue

**Title:** Add script to package SWC female rat atlas

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**What does this PR do?**

Creates a pipeline to package SWC female rat atlas. 

- pre_packaging:
  - prepare Waxholm template and annotations
  - bash scripts to run ANTs registration and transformation
  - script to clean annotations
- main packaging script: `swc_female_rat.py`

## Is this a breaking change?

No

## Does this PR require an update to the documentation?

Potentially. README.md was added to `pre_packaging/swc_female_rat` 

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `076d3ebb273d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.