# Issue

**Title:** fixed missing preproc in ft_badsegment, ft_badchannel and ft_baddata

## Description

Added missing preproc before level is calculated in ft_badsegment, ft_badchannel and ft_baddata. Also changed name of the index variable in the loop calculating std and mean for zvalue to better match its use.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `66c54e0375d6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.