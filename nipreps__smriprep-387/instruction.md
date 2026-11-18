# Issue

**Title:** MNT: Remove AFNI from smriprep docker container

## Description

It's possible that we're using AFNI through some niworkflows pipeline, but I don't think so. This will reduce the container size a little and build time by a bit.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b5e86631b875`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.