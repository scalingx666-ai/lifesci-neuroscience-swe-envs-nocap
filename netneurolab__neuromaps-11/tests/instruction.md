# Issue

**Title:** [FIX] Fixes handling of volumetric maps for null models

## Description

A first pass towards being able to generate null maps for volumetric images. The primary issue I'm running into here is that this is computationally...I don't wanna say _impossible_, but basically impossible. If you're working with 1mm isotropic data in MNI152, by default you've got upwards of 1.8 million voxels. The distance matrix ends up being *many* terabytes :grimacing: 

Will consider ways around this... Potentially thresholding the distance matrix based on a KNN regime, where users supply the desired K as a distance (i.e., "10mm")?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f087c378e249`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.