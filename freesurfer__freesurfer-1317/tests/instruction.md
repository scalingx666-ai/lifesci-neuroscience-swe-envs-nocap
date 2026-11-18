# Issue

**Title:** Fixed bug calling the dissection_photo_gui tool on MacOS

## Description

Updated mac_wrapper to test for the model files, and call the executable from the expected path in MacOS installs.
Updated CMakeLists.txt to properly install the mac_wrapper with the proper name

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4c0e7f2190fa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.