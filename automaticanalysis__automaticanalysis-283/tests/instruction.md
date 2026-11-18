# Issue

**Title:** tidy aamod_coreg_extended_2_epi.xml

## Description

_Edited_ Small pull request that suggests:
1. tidy minor syntax (i.e., indents & argument order to match original aamodule). 
(This was something I noticed and quickly updated when debugging an old pipeline I that had used modules which are now renamed) 
2. Update CBSU parameter set to include the brainWavelet toolbox, according to the newer toolbox class method.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bdf336a9df0e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.