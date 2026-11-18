# Issue

**Title:** Fix windows install

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

CI installation fails on Windows.

**What does this PR do?**

Hard-codes h5py<=3.9 dependency.

## References

temporary fix #258 - don't support python 3.11 for Windows GUI for now. 

## How has this PR been tested?

CI install is successful (although tests fail)

## Is this a breaking change?

Nope.

## Checklist:

- [n/a] The code has been tested locally
- [n/a] Tests have been added to cover all new functionality (unit & integration)
- [n/a] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f6388880fdd8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.