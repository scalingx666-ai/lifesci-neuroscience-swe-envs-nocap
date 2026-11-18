# Issue

**Title:** Clearing amplitude plot when updating clusters, adding .mat file extension

## Description

Clearing "Amplitude over time" plot (in the One Group tab) when a new cluster group is selected so that only the current spike amplitudes are visualized. Previously, amplitudes from other, not currently selected cluster groups were also included.
Adding .mat extension to output filename cluster_info.mat.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b8df52f48ea7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.