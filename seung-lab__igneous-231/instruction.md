# Issue

**Title:** Render Meshes For Zarr Volume

## Description

I decided to try to see if these render properly. 

If the volume is zarr, it adds mesh source to the config, if it's present in the cloud files.


After running `mesh forge` and `mesh merge` for [20200812-CardiomyocyteDifferentiation14-Cycle1.zarr](https://zenodo.org/records/10257532), the labels render. 

However, the output dimensions of the segmentation volume are not correct. Is this expected for zarr ?

<img width="1728" height="1117" alt="Screenshot 2026-11-12 at 18 23 30" src="https://github.com/user-attachments/assets/565d9a47-4626-4c7b-8f92-344a68b399d9" />
<img width="1728" height="1117" alt="Screenshot 2026-11-12 at 19 11 01" src="https://github.com/user-attachments/assets/4522917c-6aa1-4736-a8b3-d514dbaa4c6c" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `de05977b152e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.