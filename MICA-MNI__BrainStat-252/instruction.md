# Issue

**Title:** [FIX] Fixes incomplete label names in the context decoder

## Description

- Fixes feature names containing spaces.
- Adds CIVET compatibility by nearest neighbour interpolation for parcellations and gradients.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fedf808c839d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.