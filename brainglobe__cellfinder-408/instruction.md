# Issue

**Title:** Adapt CI so it covers both new and old Macs, and installs required additional dependencies on M1

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

`macos-latest` is now a Silicon Mac runner, so we need to adapt CI accordingly

**What does this PR do?**
* ensures CI is run on both Mac chip architectures
* runs tensorflow include guard tests on Silicon mac instead.

## References

Partial solution to 

## How has this PR been tested?

CI that was breaking before, now passes

## Is this a breaking change?

Now

## Does this PR require an update to the documentation?

No

## Checklist:

- [n/a] The code has been tested locally
- [n/a] Tests have been added to cover all new functionality (unit & integration)
- [n/a] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e6a887f1721b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.