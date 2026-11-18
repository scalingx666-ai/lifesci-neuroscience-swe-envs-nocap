# Issue

**Title:** Import header from brainglobe-utils

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [X] Other

**Why is this PR needed?**
`cellfinder` currently contains a copy of the html headers from `brainglobe_utils`

**What does this PR do?**
This PR imports the headers from `brainglobe_utils` and removes any duplicates in this repo.
Needs changes from 

## References

For 

## How has this PR been tested?

All tests pass locally.

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `de73504d4264`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.