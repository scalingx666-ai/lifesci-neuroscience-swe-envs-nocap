# Issue

**Title:** adapt blackcap script for v1.3 and 1.4

## Description

Updates the script to package the blackcap atlas.

I've moved some annotation smoothing I did to  because I needed the `save_to_asr_nii` function, as a quick and dirty solution (the function will be moved to utils as part of a planned template-builder tidy-up in the next few months) - so we can resubmit the article.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d060336751d6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.