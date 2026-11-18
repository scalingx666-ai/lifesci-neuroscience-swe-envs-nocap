# Issue

**Title:** make non-conda mac tests use intel chips

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
Non-conda tests were failing due to `macos-latest` now being run on Silicon tests.

**What does this PR do?**
Makes non-conda tests use Intel macs for now, and explains this in comments in the workflow file.

## References
Partial solution to 

Related to 

## How has this PR been tested?

CI runs observed.

## Is this a breaking change?

No

## Does this PR require an update to the documentation?

No

## Checklist:

- [n/a] The code has been tested locally
- [n/a] Tests have been added to cover all new functionality (unit & integration)
- [n/a] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c66a315fa390`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.