# Issue

**Title:** 3dShuffle

## Description

Permutation testing program `3dShuffle`. 

Currently focuses on the first intended use case: single-brick datasets with matched subjects across repeated-measure conditions. Pairing is assumed by input order. The program supports labeled conditions, optional subject labels, directional contrasts, exact or random sign-flip permutations, voxelwise empirical p-values, and max-stat FWE correction. Output is a single bucket dataset with mean difference, observed paired t, uncorrected p/z, and FWE-corrected p/z bricks for each contrast.

```
3dShuffle                                \
  -conditions 2                          \
  -cond_labels endsleep longrec          \
  -input end_s01+tlrc end_s02+tlrc ...   \
  -input ltr_s01+tlrc ltr_s02+tlrc ...   \
  -contrast longrec endsleep             \
  -method signflip                       \
  -stat paired_ttest                     \
  -tails one                             \
  -mode exact                            \
  -prefix ltr_gt_end_perm
  ```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a4345cdb0924`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.