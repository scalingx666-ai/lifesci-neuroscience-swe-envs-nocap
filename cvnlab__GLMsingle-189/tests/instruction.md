# Issue

**Title:** fixes: correct pcnum selection in glmsingle.py and session loop data handling in calcbadness.py

## Description

Fixes two small bugs in GLMsingle Python implementation, described in 

1. Use cross-validated pcnum instead of total n_pc for PC selection
   - glmsingle.py: Replace n_pc with pcnum when adding principal component regressors to extra_regressors
   - This ensures only the optimal number of PCs (determined via cross-validation) are used rather than all available PCs
   - This is only relevant for scenarios where extra_regressors have been input by the user. Thus this bug is unlikely to have impacted many users to this point.

2. Fix session loop data copying in calcbadness function  
   - calcbadness.py: Move resultsdm = copy.deepcopy(results) outside the 
     session loop to preserve z-score transformations across sessions
   - Previous implementation re-copied results on each session iteration, 
     losing transformations from earlier sessions
   - This issue is only relevant for scenarios where multiple sessions of data have been input simultaneously by the user. Thus this bug is also unlikely to have impacted many users to this point. 

Both fixes ensure the algorithms use intended cross-validated parameters and preserve data transformations as designed. Fixes were validated with a test suite to ensure that the changes have the desired effect.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `08ebf0390e8f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.