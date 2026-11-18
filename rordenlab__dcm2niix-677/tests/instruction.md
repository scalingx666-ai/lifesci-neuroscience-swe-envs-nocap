# Issue

**Title:** GE phase encoding polarity with (0018, 9034)

## Description

I have extensively tested datasets with different combinations of Freq. and phase encoding directions/polarity including DV26, Rx29.1, MR30 software versions. This commit fixed the #674 issue.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `865dab86761b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.