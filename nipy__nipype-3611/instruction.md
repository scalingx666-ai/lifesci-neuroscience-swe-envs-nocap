# Issue

**Title:** [FIX] MRTrix3 change inputs position for MRTransform

## Description

If several arguments are used (for example invert and linear_transform) they are not all take into account (and so it is not the same behavior as the native mrtrix3 command). 
I think that it is because they are all set to `position = 1`
I think it is not necessary to precise `position` for those arguments as `argstr` is already filled with an information about position .

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `682abacfb7d5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.