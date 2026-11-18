# Issue

**Title:** Removed old csh wrapper, replaced with python implementation

## Description

Removed original infant_recon_all script implemented in csh.
Renamed infant_recon_py -> infant_recon_all
Removed unused section of infant/CMakeLists.txt that was used to install the old python env for infant fs

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f07a78aed9ac`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.