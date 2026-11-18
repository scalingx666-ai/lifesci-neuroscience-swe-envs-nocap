# Issue

**Title:** Install HDF5 for mac CI

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

Installation of `brainrender` fails on MacOS.

**What does this PR do?**

Adds a step to the Mac CI that `brew install`s HDF5.

## References

temporary fix for #259 

## How has this PR been tested?

Looking at CI output.

## Is this a breaking change?

Nope

## Does this PR require an update to the documentation?

Yes - we will document any new things that users need to do to install on Mac (If we can't avoid this).

## Checklist:

- [n/a] The code has been tested locally
- [n/a] Tests have been added to cover all new functionality (unit & integration)
- [n/a] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f6388880fdd8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.