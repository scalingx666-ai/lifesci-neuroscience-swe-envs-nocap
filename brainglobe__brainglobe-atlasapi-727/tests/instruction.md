# Issue

**Title:** update script for 2022 version of allen, remove allensdk

## Description

## Description
Here we add the 2022 version of the Allen. We also remove the allensdk as it is becoming increasingly incompatible with other parts of brainglobe (getting it to work in Python3.13 while supporting threading was too hard)
**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

## References
#233 


## Does this PR require an update to the documentation?
Yes we will update the atlas docs. 
## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1d7d1e1ea912`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.