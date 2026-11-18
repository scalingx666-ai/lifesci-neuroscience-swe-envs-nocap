# Issue

**Title:** fixing cellpose_overlap function in chan2detect

## Description

Hi people,
as described in #695 and #755 suite2p encountered an error after actually running cellpose.
The error message 'ERROR importing or running cellpose, continuing without anatomical estimates' is misleading, because cellpose actually runs nicely. There is merely a simple dimension error in chan2detect causing the upstream 'try' statement in the detect function. Hope the change fixes it.
Best
Uwe

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `12dc119ac0c7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.