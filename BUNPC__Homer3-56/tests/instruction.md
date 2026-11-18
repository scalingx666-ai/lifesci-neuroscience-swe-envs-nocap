# Issue

**Title:** User function fixes and changes

## Description

- User functions which took tIncMan or tIncAuto now take both (mlActMan/mlActAuto as well)
- Fixed a bug in which the tInc matrix was being generated improperly in the no stims case for hmrR_MotionCorrectSpline
- GLM function which takes basis function amplitude and duration parameters from the stimulus marks, previously called hmrR_GLM_new, is now called hmrR_GLM. The old version of called hmrR_GLM_old
- hmrR_tCCA and hmrR_OD2Conc parameter format changed to take advantage of variable length support

Misc
- Fixed a getter from raising an exception when trying to index into empty stim data

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5e70a5279607`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.