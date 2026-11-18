# Issue

**Title:** Raise error if two-echo data are provided

## Description

Replaces #3569. Relates to #3364. This acts as a short-term patch until we figure out how best to process two-echo fMRI data.

## Changes proposed in this pull request

- If two-echo fMRI data are provided and `--echo-idx` is not, raise a RuntimeError.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e3c6dfd491c6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.