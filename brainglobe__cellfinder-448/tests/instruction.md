# Issue

**Title:** temporarily depend on numpy<2

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**

Training currently fails because of keras and nump

**What does this PR do?**

Temporarily pin to numpy < 2

## References

Workaround for #446

## How has this PR been tested?

Locally, as described in #446

## Is this a breaking change?

Nope

## Does this PR require an update to the documentation?

Nope

## Checklist:

- [x] The code has been tested locally
- [ \ ] Tests have been added to cover all new functionality (unit & integration)
- [ \ ] The documentation has been updated to reflect any changes
- [ \ ] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2536bea619e2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.