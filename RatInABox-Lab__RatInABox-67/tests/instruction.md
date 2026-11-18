# Issue

**Title:** Update FieldOfViewNeurons.py

## Description

Fixed the bug that FoV Neurons with BVC decreased their firing rate with increase of the wall distance. It was because cell_fr_norm was calculated during BVC initialization when the cells tuning parameters are not changed yet.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cd8ad87b58bf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.