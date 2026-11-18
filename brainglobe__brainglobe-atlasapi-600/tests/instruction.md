# Issue

**Title:** [586]: Improvements and refactoring to handle units in utils

## Description

## Description

Refactor the atlas representation to separate resolution from its unit, enhancing clarity in the naming conventions. Update tests to reflect these changes.

**What is this PR**

- [x] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

Previous name generation was broken.

**What does this PR do?**

Add unit parsing and default to `um` for units.

## References

Please reference any existing issues/PRs that relate to this PR.

## How has this PR been tested?

pytest

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

No.

## Checklist:

- [ ] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [ ] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `decf986306bc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.