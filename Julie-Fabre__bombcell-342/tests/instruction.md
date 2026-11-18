# Issue

**Title:** Refactor/plotting/histograms

## Description

The original function responsible for plotting histograms included many lines devoted to the definition of constants. I have moved these lines to a new file called plotting_utils.py.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1e7f44f3779b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.