# Issue

**Title:** Free space on CI/CD

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**


The addition of a recent version of the Android SDK has cause the Ubuntu tests to run over the provided 14GB of free space.

**What does this PR do?**
Adds a step to the CI pipeline to delete unnecessary software to free up space. 

## How has this PR been tested?

CI passes.

## Is this a breaking change?

No

## Does this PR require an update to the documentation?

No

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cb4167ad46ab`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.