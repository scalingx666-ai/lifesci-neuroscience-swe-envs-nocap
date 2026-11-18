# Issue

**Title:** Update V2 references to V3

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
All constants, and docstrings were using the previous V2 monicker. 

**What does this PR do?**
All mentions of V2 have been changed to V3.

## How has this PR been tested?
Tested locally.

## Is this a breaking change?
No

## Does this PR require an update to the documentation?
No

## Checklist:

- [x] The code has been tested locally
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a733a33146aa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.