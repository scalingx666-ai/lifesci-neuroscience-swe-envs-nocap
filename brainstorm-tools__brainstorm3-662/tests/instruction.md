# Issue

**Title:** [out_mri_bst] add saving version option

## Description

Very minor change to out_mri_bst: Add a parameter to change the saving option. 
Using v6 instead of v7 is saving 7 seconds when saving an MRI.  

see

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `da97ac6d271b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.