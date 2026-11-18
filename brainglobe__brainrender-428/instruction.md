# Issue

**Title:** Use date tagged files for logging

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
Unlinking the log files on each `brainrender` import was causing issues when multiple copies of `brainrender` are run simultaneously. . 

**What does this PR do?**
Tags the log for each run with a date to prevent conflicts. Adds a setting for maximum number of logs kept.

## References
 

## How has this PR been tested?
Tested locally, with `brainrender` and `brainglobe-heatmap`.

## Is this a breaking change?
No

## Does this PR require an update to the documentation?
No. I don't think we refer to the `brainrender` logs by name anywhere in the docs.

## Checklist:

- [x] The code has been tested locally
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e00ad0b0c2cc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.