# Issue

**Title:** Rtqa patch 1

## Description

First patch introducing the real-time quality assessment for fMRI
What's new:
1. RTQA for time-series in a new sub window
2. Two new helpers in MATLAB especially for RTQA for volumes
3. Recursive SNR method is applied in this module for ts and volumes
4. TS-RTQA seems to be working fine
5. Volume-RTQA shows SNR in triplanar-mode if "Volume SNR' checkbox on RTQA-window is on

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `76df7e5a2025`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.