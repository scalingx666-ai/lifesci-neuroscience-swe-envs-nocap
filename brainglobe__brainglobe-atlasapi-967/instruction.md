# Issue

**Title:** Exclude DracoPy 2.1.0

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
DracoPy is missing wheels for ARM based macs for version 2.1.0. This leads to a build error when installing in a fresh environment.

**What does this PR do?**
Excludes DracoPy==2.1.0

## References
#966 

## How has this PR been tested?
Environment resolves successfully if DracoPy == 2.0.0 is installed first.

## Is this a breaking change?
No

## Does this PR require an update to the documentation?
No

## Checklist:

- [x] The code has been tested locally
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1b6e8cef4432`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.