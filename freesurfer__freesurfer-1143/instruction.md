# Issue

**Title:** Added the compiled Intel Mac executable for ThalamicNucleiDTI and updated the CMakeLists.txt

## Description

Added ThalamicNucleiDTI/mac_x86_64 containing the Matlab executable compiled for Intel Macs and the accompanying wrapper script.
ThalamicNucleiDTI/CMakeLists.txt was updated to detect Intel Macs and install the proper executable and wrapper to the freesurfer/bin.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c9e5819d28ec`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.