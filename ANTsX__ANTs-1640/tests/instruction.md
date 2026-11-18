# Issue

**Title:** Make antsBrainExtraction.sh less sensitive to image size

## Description

Addressing #1638.

Updated N4, downsampling procedure to not smooth and downsample non-human or neonate images too much.

I exposed the antsAI search parameters to the user because I think they are harder to guess from the input compared to the downsampling. The defaults are unchanged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `31597502a4cb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.