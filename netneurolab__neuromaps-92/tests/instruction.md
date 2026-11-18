# Issue

**Title:** [FIX] Fix medial wall masks for fsLR 4k and 8k surfaces

## Description

Changed the right hemisphere medial wall masks for fsLR 4k and 8k surfaces to be the same as the left hemisphere mask because the fsLR surface is symmetric. Previous medial wall mask was incorrect, resulting in missing patches when plotting 4k or 8k surfaces, as well as when transforming from fsLR 4k/8k to other densities/spaces.

(This fix is related to Issue #21... only 1.5 years late!)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `47ea75f992e6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.