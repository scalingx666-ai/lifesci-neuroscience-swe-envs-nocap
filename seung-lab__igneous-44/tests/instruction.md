# Issue

**Title:** feat: introduce tinybrain

## Description

Moved most of the downsampling logic into https://github.com/seung-lab/tinybrain

It also has the benefit of being much faster, lower memory, and having less loss of precision for downsample_with_averaging

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1933bf9b4f01`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.