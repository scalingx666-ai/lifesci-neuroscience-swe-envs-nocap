# Issue

**Title:** ADD: meshnet + documentation

## Description

Also look at [Chris's MeshNet implementation](https://github.com/chrisfilo/peaks2maps/blob/bbdefbf7222101405b0381f01c6c9056fa7a652e/models/meshnet.py). That could serve as a good API for nobrainer — each model function returns an estimator.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `90bb6e58f42b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.