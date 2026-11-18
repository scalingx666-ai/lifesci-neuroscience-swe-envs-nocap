# Issue

**Title:** Refactor/plotting/histogram2

## Description

I've refactored the code responsible for plotting histograms. Instead of thresh1 and thresh2, it uses min_threshold and max_threshold. Instead of hard-coding range labels (Neuronal, Noise, Somatic, Non-Somatic, MUA, Good), these values are now encoded in the MetricInfo tuple defined in plotting_utils.py. The code is simplified and much redundancy is removed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1fdc7a82a2e4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.