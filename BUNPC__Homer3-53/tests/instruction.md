# Issue

**Title:** User function improvements (Reverted)

## Description

Changes and improvements to user functions
- GLM_new, which uses basis function amplitude and duration from stims, is now the standard GLM function
- tIncMan and tIncAuto as well as mlActMan and mlActAuto are used everywhere one is used, and tInc and mlAct have been removed from function calls
- hmrR_tCCA and hmrR_OD2Conc parameter format changed to take advantage of new variable-length parameter support
- Bug in hmR_MotionCorrectSpline fixed

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5e70a5279607`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.