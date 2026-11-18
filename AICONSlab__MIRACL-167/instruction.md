# Issue

**Title:** [PR/fix/feat] fix Clarity Allen registration

## Description

This fixes several major issues in the Clarity Allen registration script:
1. Channel prefix and number are now flags in the Clarity Allen registration method. This is necessary for registrations of scans that used channel prefix and number for conversion (e.g. LaVision). Before this would fail as the registration script had no method to differentiate between e.g. autoflor and signal channels in the RAW tif folder delimited by the channel prefix/number combination.
2. The tif stack extraction uses `tifffile` now instead of `c3d`. The latter was failing with larger tif files (e.g. SMARTSpim vs. LaVision). Debugging/profiling indicated that larger files (SMARTSpim) triggered parallel processing in `c3d` which potentially lead to race conditions that weren't apparent when extracting smaller files (LaVision). The result was that the stack got extracted with the slides being out of order.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7df2f6e83919`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.