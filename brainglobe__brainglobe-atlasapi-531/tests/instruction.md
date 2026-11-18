# Issue

**Title:** Increase update_atlases test coverage

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
Make code in `brainglobe-atlasapi` more robust by increasing test coverage.

**What does this PR do?**
- Increase test coverage `update_atlases.py`
- Replaces `install_atlas` `ValueError `with a `TypeError `if atlas_name is not a string specifying the expected type.

## References
#518 

## How has this PR been tested?

## Is this a breaking change?
No.

## Does this PR require an update to the documentation?
No.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cffe90272229`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.