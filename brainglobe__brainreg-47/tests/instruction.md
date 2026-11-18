# Issue

**Title:** add an option to save registered atlas with the same orientation as he input data

## Description

I added an option --save_original_orientation

The flag is passed through the different functions and used in run_niftyreg. It just loads the registered atlas, map it using bg-space and save it back as tiff. I added the info in the readme but it might be worth adding it in the readthedoc also.

I modified the paths class to add the registered_atlas_original_orientation.

I try it on two datasets and it works fine.

PR to solve #40

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `75be88c08658`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.