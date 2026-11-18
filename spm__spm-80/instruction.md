# Issue

**Title:** Fixes UIControl warnings in R2025b on SPM launch

## Description

On MATLAB R2025b, when `spm` is launched without specifying modality and then a modality is selected from the pop-up GUI, several warnings are triggered. 

These warnings are about `UIControlPushButtonController`, and appear to arise due to the way callbacks are ordered in `spm_Welcome.m`: the figure is cleaned up while the callback is being processed. The callback tries to access the figure, but fails since it no longer exists. Moving the clean-up step to the end of the callback allows events to complete before cleanup, preventing the warnings.

Tested on:
- MATLAB R2025b on Debian 13
- MATLAB R2024b on Debian 13
- MATLAB R2025b on Windows 11

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4a67d9208314`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.