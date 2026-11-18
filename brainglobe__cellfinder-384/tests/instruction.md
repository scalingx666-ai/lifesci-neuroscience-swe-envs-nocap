# Issue

**Title:** Switch order of arguments passed to prep_model_weights in train_yml.py

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
Trying to continue training without passing a trained model/model weights was leading to a crash.

**What does this PR do?**
Fixes the order arguments are passed to `prep_model_weights` in `cellfinder/core/train/train_yml.py` to match with the rest of the codebase.

## References

Please reference any existing issues/PRs that relate to this PR.

## How has this PR been tested?

All previous tests pass locally on Ubuntu.

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

No

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3bd5839aac36`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.