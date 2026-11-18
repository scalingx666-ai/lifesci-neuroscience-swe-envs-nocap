# Issue

**Title:** free-disk space action should run on all ubuntu runners

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**What does this PR do?**

This PR avoids sporadic test failures related to the runner VM's available disk space for the non-standard tests we run for cellfinder (the numba-disabled run and the brainmapper CLI tests).

It does so by removing a conditional on the operating system in the `free-disk-space` step. This simplifies the step (it's only run on one OS anyway, so we don't need to condition on the OS: we either have the step or not) and should avoid sporadic test failures such as https://github.com/brainglobe/cellfinder/actions/runs/20222458182

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a6aa15f2d500`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.