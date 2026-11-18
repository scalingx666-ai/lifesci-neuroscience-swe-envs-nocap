# Issue

**Title:** Fix Augmentation Likelihood

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**  
`random_bool` in `cellfinder.core.tools.tools` uses `uniform(0, 1) > likelihood`, which inverts the intended probability (e.g., 0.1 becomes ~90% True). This affects augmentation and other probability-based logic. Issue: #580.

**What does this PR do?**  
- Fixes the comparison to `uniform(0, 1) < likelihood` so the probability matches the parameter name.  
- Adds unit tests to ensure correct threshold behavior.

## References



## How has this PR been tested?

Added unit tests in `tests/core/test_unit/test_tools/test_tools_general.py`.  
(Not run locally in this environment.)

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

No.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `63f45e2e2cd0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.