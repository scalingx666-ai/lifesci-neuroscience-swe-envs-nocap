# Issue

**Title:** Pins numpy to avoid deprecation warnings

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
 

**What does this PR do?**
Pins `numpy<2.5.0` until VTK 9.7.0 is released and we decided on PyMCubes.

## References
#926 

Will keep this open as a reminder to revisit and unpin.

## How has this PR been tested?
All tests pass locally.

## Is this a breaking change?
No

## Does this PR require an update to the documentation?
No

## Checklist:

- [x] The code has been tested locally
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a778c9bc3602`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.