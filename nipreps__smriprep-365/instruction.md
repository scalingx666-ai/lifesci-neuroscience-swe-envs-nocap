# Issue

**Title:** ENH: Save msm registration sphere as desc-msm_sphere.surf.gii

## Description

in smriprep-next. This continues to save the initial `space-fsLR_desc-reg_sphere.surf.gii` and adds `space-fsLR_desc-msm_sphere.surf.gii`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b06504587de8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.