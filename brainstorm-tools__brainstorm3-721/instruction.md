# Issue

**Title:** Tutorial: Add cMEM estimates in tutorials

## Description

Hello, 

As we will be merging  soon, this  PR update the script corresponding to cMEM of the two following tutorials: 

- [x] Add cMEM estimate to `tutorial_epilepsy.m` and add it to tutorial page:
  https://neuroimage.usc.edu/brainstorm/Tutorials/Epilepsy 

- [x] Create `tutorial_BEst.m` which reproduces the steps in the updated Brain Entropy tutorial page:  
  https://neuroimage.usc.edu/brainstorm/Tutorials/TutBEst
  This script the Introduction protocol computed with `tutorial_introduction`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6c646d2248c8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.