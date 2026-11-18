# Issue

**Title:** [REF] Fixes Cammoun et al., 2012 Freesurfer files

## Description

Previous surface .annot files for the Cammoun 2012 parcellation were out-of-sync with the volumetric images. This fixes them and addresses a whole bunch of other changes that were resolved in the processing of that fix.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `335b99fa33a3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.