# Issue

**Title:** ENH Add more options for freesurfer's automatic alignment, move code for FSL's automatic alignment

## Description

This change will allow using volumes with T1 contrast as a reference for automatic alignment. It will also allow passing a registration file for initialization.

I moved the code for the automatic alignment using FSL to `cortex.align.automatic_fsl`. I doubt it will be used because freesurfer's bbregister works very well, but it's there.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aa4b48c6373f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.