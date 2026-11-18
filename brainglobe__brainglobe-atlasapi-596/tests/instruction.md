# Issue

**Title:** A small functionality added to annotation_utils.py together with a new test for it.

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
Currently the read_itk_labels function only supports 1-letter acryonym
**What does this PR do?**
Now it allows the user to choose the number of first letters the user want to use as structure acryonym.

## How has this PR been tested?

Locally

## Is this a breaking change?

no

## Does this PR require an update to the documentation?

no

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [ ] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ab96702bedb9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.