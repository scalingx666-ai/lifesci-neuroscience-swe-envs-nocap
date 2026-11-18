# Issue

**Title:** Process: Combine recordings, handle MEG/EEG spatial transformations, and head points

## Description

This PR is here to fix an issue when combining MEG - SEEG data where few matrices containing spatial transformation information were not copied by the combining process. Notably, the head localization error (and the process using it, such as finding a stable period) has issues without those matrices. 

This seems to be working on the example we tested. but i am not sure what to do if the transfMEG / transfEEG matrix are defined by multiple files.  Maybe copy the MEG for MEG and EEG for EEG. idk

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bd8566791a72`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.