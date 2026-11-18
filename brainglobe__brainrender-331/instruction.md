# Issue

**Title:** update to latest vedo release

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
Tests don't pass with latest `vedo`.

**What does this PR do?**
Bumps minimum `vedo` version and fixes a test accordingly.

## References
 

## How has this PR been tested?

Tests fail with latest vedo locally at f23f4eb:
`FAILED tests/test_integration.py::test_slice - ValueError: The truth value of an array with more than one element is ambiguous. Use a.any() or a.all()`

Tests pass with latest vedo after fixing test: see checks below
Extra visual inspection locally was also performed.

## Is this a breaking change?
No

## Does this PR require an update to the documentation?
No

## Checklist:

- [x] The code has been tested locally
- [n/a] Tests have been added to cover all new functionality (unit & integration)
- [n/a] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4fbea92dc487`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.