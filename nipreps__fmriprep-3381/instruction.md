# Issue

**Title:** CI: Fetch tags and 200 commits to support describe

## Description

This tests the behavior of PRs with the docker build. It should reuse the `ghcr.io/nipreps/fmriprep:master` cache and create `ghcr.io/nipreps/fmriprep:pull-3381` or similar.

It also checks out enough history to properly create a version string.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1d6ac2bb6b93`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.