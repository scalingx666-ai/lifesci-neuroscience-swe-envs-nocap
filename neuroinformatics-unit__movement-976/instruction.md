# Issue

**Title:** User warning

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
While reviewing #832 I was also checking for other `logger.warning` uses and identified a few cases which should be "user-avoidable" and should instead use `warnings.warn`.

**What does this PR do?**
- use `warnings.warn` in user-avoidable conditions and update affected tests
- update contributing guide to include guidance on `logger.warning` usage

## References
Follow-up rom #832 

## How has this PR been tested?
Tests have been updated accordingly to check for UserWarnings and to match the expected warning message.

## Does this PR require an update to the documentation?
Added guidance on when to use ` logger.warning`

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cf9728e65aad`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.