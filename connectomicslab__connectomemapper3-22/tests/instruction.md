# Issue

**Title:** Updated multi-scale parcellation with a new symmetric version

## Description

**Tasks:**
- [x] Update annotation files
- [x] Update version
- [x] Update doc with version changes

**Generation of the new Freesurfer annotation files**
1. The right hemisphere labels were projected in the left hemisphere to create a symmetric version of the multiscale cortical parcellation proposed by [[Cammoun2012]](https://doi.org/10.1016/j.jneumeth.2011.09.031).
2. For scale 1, the boundaries of the projected regions over the left hemisphere were matched to the boundaries of the original parcellation for the left hemisphere.
3. This transformation was applied for the rest of the scales.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `684f2a6fb7c9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.