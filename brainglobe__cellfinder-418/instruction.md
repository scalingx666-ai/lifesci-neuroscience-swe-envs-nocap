# Issue

**Title:** Updating to Keras 3.0 and migrating to PyTorch

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
`tensorflow` has become increasingly difficult to support (e.g. lack of GPU support on native Windows). Switching to `keras` 3.0 allows us to migrate to using `torch` as the backend instead of `tensorflow`. This will make future maintenance easy and allow us to support Python 3.11+.

**What does this PR do?**
Upgrades to `keras` 3.0.
Sets `torch` as the default backend.
Removes any functions related to `tensorflow` (error suppression etc...)

## References



#266 

## How has this PR been tested?
All tests pass on CI, basic workflows have been tested by manual inspection.

## Is this a breaking change?
No.

## Does this PR require an update to the documentation?
Yes, see 

## Checklist:

- [x] The code has been tested locally
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `de834d28e9de`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.