# Issue

**Title:** Smooth edge effects in inferred alphas

## Description

- There can be edge effects due to separating the data into sequences.
- In particular the inferred alphas near the start and end of a sequence can be discontinuous between sequences.
- We can avoid this by predicting alphas for overlapping sequences and disregarding the time points near the ends of the sequence.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ffd96098dfb3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.