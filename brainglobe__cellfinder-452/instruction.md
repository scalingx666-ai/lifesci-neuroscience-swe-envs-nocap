# Issue

**Title:** Unpin numpy

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
Previously, `keras` was incompatible with `numpy>=2.0`. This is solved by 

**What does this PR do?**
Unpins `numpy` and pins `keras>=3.5.0` to ensure `numpy>=2.0` compatibility.

## References
#446 (nearly closes but the `numpy<2.0` pin remains for Windows) 

## How has this PR been tested?
All tests pass in a fresh environment with `numpy==2.0.1` and `keras==3.5.0`.
Manual testing by starting training via the `napari` GUI.


## Is this a breaking change?
No

## Does this PR require an update to the documentation?
No

## Checklist:

- [x] The code has been tested locally
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `de4d498cd0a9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.