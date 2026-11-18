# Issue

**Title:** basic fix avoiding writing to package files

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
Specifying a non-default model currently writes to package files (which is a bad idea in general, but in particular causes errors on shared systems like our local HPC).

**What does this PR do?**
User-specified model configuration files are written to user folder instead.
It also documents and renames some of the functions involved.

## References



## How has this PR been tested?

Existing tests pass.

## Is this a breaking change?
No.

## Does this PR require an update to the documentation?
No.

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7c32007822da`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.