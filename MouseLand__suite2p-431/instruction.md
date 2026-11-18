# Issue

**Title:** Fixes reg_tif issue with second channel

## Description

PR addresses #427.

- Modified existing regression test to check `reg_tifs` generated for 2 channels. 
- Modified compare_output util function to accomodate `tif` files. 
- Removed redundant `2plane2chan` pipeline test

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8be71983ead5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.