# Issue

**Title:** MAINT: Work around persistent ds000248 failure

## Description

I tried using `exclude` to exclude just the problematic `brain` dir, but this also excluded the `brain.mgz` which makes the FLASH run not work.

We don't exclude that much stuff from the download anyway, so let's try just using the `aws` CLI method from the ["how to download"](https://openneuro.org/datasets/ds000248/versions/1.2.4/download#) to work around

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1dcc70eacbd9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.