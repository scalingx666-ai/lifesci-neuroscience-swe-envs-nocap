# Issue

**Title:** Refactor to use ImageIOLoadException from brainglobe_utils

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [X] Other

**Why is this PR needed?**
`brainreg` currently has a `LoadFileException` class that should be refactored into brainglobe-utils, and imported from there

**What does this PR do?**
This PR uses the refactored `ImageIOLoadException` from brainglobe-utils

## References

For 
Related to refactoring in 

## How has this PR been tested?

Tests were updated, and all pass locally.

## Is this a breaking change?

No

## Does this PR require an update to the documentation?

No

## Checklist:

- [X] The code has been tested locally
- [X] Tests have been added to cover all new functionality (unit & integration)
- [X] The documentation has been updated to reflect any changes
- [X] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `31e2111b0739`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.