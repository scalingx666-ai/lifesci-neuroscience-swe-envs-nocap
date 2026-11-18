# Issue

**Title:** Added ability to change maximum kernel width in smoothImage

## Description

Added max_kernel_width argument to smoothImage to ITK:: SetMaximumKernelWidth for smoothing.  Also, added .Rhistory to .gitignore as that got added unintentionally.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `20baf2a1b7c5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.