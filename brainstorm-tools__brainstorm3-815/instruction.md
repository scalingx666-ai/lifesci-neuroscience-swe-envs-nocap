# Issue

**Title:** [Head model] Add the possibility to compute head model for NIRS

## Description

Hello, 

I merged PR  this morning. This PR changed the way nirstorm is saving the head model so that it's compatible with the other type of head model created by Brainstorm. 

With this PR, we are adding nirs to the panel to compute head model. Effectively allowing the users to compute the NIRS head model directly from the GUI. 

I will upload a minimal nirs protocol tomorrow so you can do some tests. 


Edouard

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `407142c10a40`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.