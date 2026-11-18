# Issue

**Title:** AP suggestion: handle/fail differently for polort<0 in 3dToutcount

## Description

@afni-rickr : 

What do you think about this change in handling polort values for 3dToutcount?  This was prompted by a case in which a user had `-regress_polort -1`, which created a failure later on down the road in the proc script execution.

Separately, 3dToutcount fails with polort <0, but with the wrong error message, so I am going to edit that in the master branch.

Basically, 3dToutcount cannot have a polort <0.  This puts a check for that earlier on, and fails if a user advertently or inadvertently creates a situation for that.  But there may be better ways to implement this in the code.  I have greatly expanded the number of lines in this function...

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c924c968e358`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.