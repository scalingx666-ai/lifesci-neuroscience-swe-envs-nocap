# Issue

**Title:** Add early atlas output check with overwrite option

## Description

## Description

**What is this PR**

- [x] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
- Atlas generation could fail only at the very end if an atlas output directory already existed, this PR ensures such cases are detected early.

**What does this PR do?**
- Adds an early check for existing atlas output directories in ```wrapup_atlas_from_data``` and introduces an overwrite option to explicitly replace them when needed.

## References
-  

## How has this PR been tested?
- Tested locally by simulating existing atlas output directories.

## Is this a breaking change?
- No, default behavior remains unchanged and the new overwrite flag is optional

## Does this PR require an update to the documentation?
- No

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [ ] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5508e5525af6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.