# Issue

**Title:** Pass ENV variables necessary for `getpass.getuser` to tox for CI

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
Windows test were failing, see https://github.com/brainglobe/cellfinder/actions/runs/21219047161/job/61146370989?pr=528

**What does this PR do?**
Passes the environmental variables necessary for https://docs.python.org/3/library/getpass.html#getpass.getuser to work on Windows

## How has this PR been tested?
Tested on CI

## Is this a breaking change?

If this PR breaks any existing functionality, please explain how and why.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b14b22484ecd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.