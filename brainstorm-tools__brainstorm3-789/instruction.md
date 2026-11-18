# Issue

**Title:** Bugfix: `ContactNumber` check only needed for SEEG in `SetElectrodeLoc`

## Description

Introduced in 3017616

**The error**
While doing this section https://neuroimage.usc.edu/brainstorm/Tutorials/ECoG#ECoG_grid:_G where the ECoG `ContactNumber` can be a grid, trying to set the contact location gives the error below:
![Screenshot 2025-05-01 182233](https://github.com/user-attachments/assets/bee78384-2baf-4247-bf89-9f5416b05d76)

This PR fixes this issue.

**Why this check ?**
This check is just needed for SEEG when user removes all but 1 contact (a feature only available for SEEG as of now) and would want to `Set skull entry` to reconstruct the electrode with the correct number of contacts

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `04249648c967`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.