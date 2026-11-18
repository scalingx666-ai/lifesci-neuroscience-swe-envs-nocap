# Issue

**Title:** Fix mixed tab/space indentation in expyriment.stimuli._video

## Description

The indentation of `expyriment.stimuli._video` was mixed, thus causing a syntax error. I fixed tthis, but please verify! In some cases the correct indentation was ambiguous, and I corrected it based on an educated guess.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2c2172f3c306`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.