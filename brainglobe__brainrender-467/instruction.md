# Issue

**Title:** Pin cloud-volume version to 12 to aid environment resolution

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
Installing the `brainglobe-meta` could pull in the wrong version of `cloud-volume` by backtracking to a version from 2021. This pins the version to a modern one (12).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b329794b166d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.