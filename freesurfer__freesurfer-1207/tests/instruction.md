# Issue

**Title:** Updated install of dissection_photo/nnUNet

## Description

Updated the CMakeLists.txt file to install the no_upsample version of the python script, created a new wrapper to call the no_upsample version.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `310fc2bba84d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.