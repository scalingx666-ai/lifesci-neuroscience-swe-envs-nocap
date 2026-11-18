# Issue

**Title:** Allow napari GUI to accept custom weights

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
 

**What does this PR do?**
Check if the `trained_model` ends in `.h5`. If so, warn the user, and load the weights into a default model.

## References
 

## How has this PR been tested?
Tested locally with the model weights from the paper.

## Is this a breaking change?
No.

## Does this PR require an update to the documentation?
Yes, will come in a subsequent PR.

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `34c8a3f804ec`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.