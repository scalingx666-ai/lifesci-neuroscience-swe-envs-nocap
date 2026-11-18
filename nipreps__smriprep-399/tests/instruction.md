# Issue

**Title:** FIX: T1w_preproc -> t1w_preproc

## Description

Small fix while writing the smoke tests in #390 turned out to be a typo. The issue was that we weren't using the `t1w_buffer` as a source for T2w preprocessing, so that if you had a preprocessed T1w image but an unprocessed T2w image, you'd try to grab the T1w from the wrong place. And I typed it wrong, and some of these checks are only found at workflow expansion.

Added workflow expansion to the test to catch this.

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e46b0e6ff2a0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.