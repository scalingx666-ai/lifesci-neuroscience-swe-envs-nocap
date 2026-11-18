# Issue

**Title:** Docker-release-ci

## Description

This adds a new GitHub action in readiness for the next release to automate the building of the corresponding `chaste/release` image.
It also renames the existing `chaste/develop` image builder action and adds `build-args` to accomodate some planned changes to the `chaste/base` image.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e1ae140bf65c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.