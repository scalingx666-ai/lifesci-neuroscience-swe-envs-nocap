# Issue

**Title:** Use arbitrary root during init

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
Currently, `brainrender` hardcodes a structure named "root" to use as the root mesh. This may lead to errors if an atlas exists but doesn't call the root node "root".

**What does this PR do?**
Generalise the current code by using the id of the root node of the atlas hierarchy to fetch an arbitrarily named root mesh to initialise the scene.

## How has this PR been tested?
All tests pass, and examples checked by visual inspection.

## Is this a breaking change?
No

## Does this PR require an update to the documentation?
No

## Checklist:

- [x] The code has been tested locally
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6476c435cb0b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.