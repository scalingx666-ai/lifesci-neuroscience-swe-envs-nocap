# Issue

**Title:** setup-mac.py now includes lib(qt)opensesame completely

## Description

Ensures more successful packaging of future additions to
lib(qt)opensesame

Updated setup-mac.py to include lib(qt)opensesame as a whole
Changed name from 0.27.2~mac1 to 0.27.2 for Mac

Packaging now successfully done

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f87383b3b154`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.