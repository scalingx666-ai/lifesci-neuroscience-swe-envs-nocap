# Issue

**Title:** rtQA for DCM data update

## Description

UPDATE:

- python part for rtQA is now able to calculate parameters recursively according to each trial
- at the begining of each trial - relevant parameters of recursion are nulled
- the same is in matlab part for 3D images

FIX:

- Kalman spikes flag is working correctly now
- Framewise displacement fix - now rotations are coverting from radians to mm

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `829bc1447c1b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.