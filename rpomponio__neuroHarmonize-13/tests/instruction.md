# Issue

**Title:** Modified code for harmonization on subjects (nifti) from new site

## Description

I changed the code to:
1. Not to throw out error message with applying harmonization on subjects from new sites
2. Save stand_mean in nifti format for subjects from new sites

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5cc2fcff0a6c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.