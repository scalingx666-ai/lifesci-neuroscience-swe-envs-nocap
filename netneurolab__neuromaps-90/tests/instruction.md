# Issue

**Title:** [FIX] Fix bugs in burt2018 and moran nulls

## Description

This PR fixes bugs in `nulls.burt2018` and `nulls.moran` encountered when trying to generate surrogate brain maps with a volumetric surface and without parcellation: the `hdist` matrix, which stores the distance between each voxel in the image, was being returned sorted. This is required for the `nulls.burt2020` function, but not for `nulls.burt2018` nor `nulls.moran`. I fixed this bug by unsorting the distance matrices when we use these two functions with a volumetric surface and without parcellation. This is a *temporary fix* as sorting, then unsorting the distance matrix is quite innefficient.

I also fixed another bug that prevented us from passing `**kwargs` to the `nulls.moran` function.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `76ef87315610`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.