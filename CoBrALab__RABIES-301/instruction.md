# Issue

**Title:** Big rewrite of Docker config as well as environment file

## Description

Changes:
- switch to micromamba-jammy
- strip down dependencies which AFNI claims it needs
- drop ANTs compilation (and builder stage) in favour of ANTs conda install
- Only download/install AFNI binaries used
- Use conda-based FSL install with minimal components
- switch from conda to mamba for package operations
- cleanup rabies_environment.yml to make it suitable for almost 100% install with conda (still need minc....)
- add in @Gab-D-G supplied minimal testing script as part of Docker build
- add `rabies_environment.dev.yml` for testing latest versions of all dependent code

Overall savings of >50% in terms of size and tons of build time by installing less total files, using mamba, and no longer building things.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a3ed63981d02`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.