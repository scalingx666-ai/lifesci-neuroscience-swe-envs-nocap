# Issue

**Title:** [FIX] Fixed linear model bug as shown in #105

## Description

This PR  i.e. it adds a masking option to SurfStatLinMod. To that end, the following changes were made:

- mesh_edges was given mask compatibility
- linear_model was refactored and given its own file
- models.py renamed to t_test.py
- Added apply_mask and undo_mask functions to stats.utils
- Y is now masked at the start of SLM.fit, subsequent parameters are also masked. Masking is undone (i.e. arrays returned to original dimensions) before multiple comparison corrections. 
- Modified the tutorial to use thickness data (instead of random data) in the mixed effects model. 

This change makes one *substantive* change to the SurfStat core architecture: vertices not in the mask are no longer included in the computation of slm.resl in SurfStatLinMod

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a8aa01a70070`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.