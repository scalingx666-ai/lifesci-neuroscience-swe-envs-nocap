# Issue

**Title:** Add some typing to analyse

## Description

## Description
**What is this pull request (PR)**
- [ ] Bug fix
- [ ] Addition of a new feature
- [X] Other

**Why is this PR needed?**
To understand the methods involved

**What does this PR do?**
Adds some minimal typing with the help of `mypy`. Looks like the `Point` class isn't being used much as most of the time the `points` being passed around are a `np.ndarray`.

## Checklist:
- [X] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [ ] The code has been formatted with [Black](https://github.com/psf/black)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0dcba1c9fe12`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.