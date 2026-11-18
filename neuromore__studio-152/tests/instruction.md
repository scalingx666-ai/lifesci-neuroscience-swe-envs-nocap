# Issue

**Title:** Fixed the issue "Classifier not running in design" caused by EDF expo…

## Description

Fixed the issue "Classifier not running in design" caused by EDF export. 

Change: set back the flag 'isRunning'  now it's true as before. 
Using session->isRunning instead.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2232228210de`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.