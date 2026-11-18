# Issue

**Title:** Switch PySide2 for PyQt5

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

## Description
Switched out PySide2 for PyQt5 in the dev dependencies. This allows CI to run using windows python 3.11.

**What is this PR**
- [x] Other

**Why is this PR needed?**
There is no versions of PySide2 that's compatible with python 3.11 and Windows.

**What does this PR do?**
Changed PySide2 to PyQt5

## References
 

## How has this PR been tested?
Tested locally and on CI

## Is this a breaking change?
No

## Checklist:

- [x] The code has been tested locally
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1b49d03f6665`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.