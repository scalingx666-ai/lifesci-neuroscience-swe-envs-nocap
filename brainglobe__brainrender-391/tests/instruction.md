# Issue

**Title:** Exposed the invert_dim parameter

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
The invert_dim parameter for loading data into `Neuron` actors was hard coded to be `True`.

**What does this PR do?**
Exposes the `invert_dim` parameter in the `Neuron` constructor, setting the default to be `True`

## References
#181 

## How has this PR been tested?

Visual inspection, all existing tests pass.

## Is this a breaking change?
No.

## Does this PR require an update to the documentation?
No.

## Checklist:

- [x] The code has been tested locally
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `02ea8d7b6ae0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.