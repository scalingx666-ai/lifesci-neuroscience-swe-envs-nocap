# Issue

**Title:** Avoid infinite recursion in plot_rate_map()

## Description

Enabled recurrent inputs to be identified when adding inputs to FeedForward Neurons. These inputs will be ignored when a groundtruth rate map is plotted, to avoid infinite recursion.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c6aeb22e9c52`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.