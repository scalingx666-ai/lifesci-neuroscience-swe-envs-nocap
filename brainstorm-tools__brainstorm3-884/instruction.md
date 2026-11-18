# Issue

**Title:** Struct Visualization: Adjust surface offsets and default alignment

## Description

Update SetStructLayout to add specific offsets for outer layers (scalp/head, outerskull, innerskull) and apply a default y-axis alignment for any other surfaces. The patch applies the computed offsets to the region vertices and updates new_dy after shifting, improving positioning of skull/scalp surfaces and providing a fallback alignment for remaining surfaces. 
@Edouard2laire can you check this patch for your question here: https://neuroimage.usc.edu/forums/t/gui-stucture-view-of-imbricated-structure/55386/3

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a39d676667c9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.