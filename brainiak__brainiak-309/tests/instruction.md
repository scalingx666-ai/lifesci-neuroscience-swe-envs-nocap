# Issue

**Title:** Update to deal with issues for convolution and drift (ready for review)

## Description

Two open issues reflect problems in fmrisim. One problem was with the convolution incorrectly downsampling — it now takes the mean and also increases the speed of analysis. Another problem was with the drift: it was a sine wave and that didn't make much sense. It now defaults to a combination of cosines.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `158e7b66e10b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.