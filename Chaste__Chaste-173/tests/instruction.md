# Issue

**Title:** Add branch and commit info to memtest output

## Description

These changes will update the index page with information taken from git.

The script on the [memory testing repo](https://github.com/Chaste/memory-testing) that generates the public index page of all memtest runs will also need updating.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4501ac2ffef7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.