# Issue

**Title:** tvb-contrib fix in data_structures_utils.py

## Description

Corrected sorting of empty spiking events in `data_structures_utils.py` in `tvb_contrib`

There was a bug for empty events dictionaries.

I corrected it for creating a sorted but empty event dictionary, e.g., when we have the indices of the neurons but none of them fired any spike.

The examples run OK.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `af96e1239216`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.