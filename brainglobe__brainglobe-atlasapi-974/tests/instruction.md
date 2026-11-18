# Issue

**Title:** Read parent_structure_id as uin32, not uint16

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
 

**What does this PR do?**
Read the parent_structure_id field as uint32 instead of uint16. 

## References
 

## How has this PR been tested?
Tested locally by inspection, and new test added.

## Is this a breaking change?
No

## Does this PR require an update to the documentation?
No

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b904a1cce82f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.