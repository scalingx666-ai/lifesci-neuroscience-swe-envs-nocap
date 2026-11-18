# Issue

**Title:** improve detection debug logs

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

**What does this PR do?**
Slightly more verbose debug logs for some parts of detection.
Might help us with memory issues in #372 

## References

#372

## How has this PR been tested?

Visual inspection of running a simple script on the SWC cluster.
Three extra lines of debug logs never hurt anyone :) 

## Is this a breaking change?

Nope.

## Does this PR require an update to the documentation?

Nope

## Checklist:

- [x] The code has been tested locally (manually)
- [n/a] Tests have been added to cover all new functionality (unit & integration)
- [n/a] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4d19fb6fb0ae`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.