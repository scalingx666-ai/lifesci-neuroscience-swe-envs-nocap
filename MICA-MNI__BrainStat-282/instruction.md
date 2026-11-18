# Issue

**Title:** [ENH] Added a warning if an Effect contains nan/inf

## Description

This PR adds a warning thrown if input to the `FixedEffect`/`MixedEffect` classes contains `NaNs` or `Infs`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9b1cb35dda02`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.