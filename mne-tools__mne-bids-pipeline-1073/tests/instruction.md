# Issue

**Title:** Drop `Raw.pick_types` and `Epochs.pick_types`

## Description

First smal PR :)

This drops the use of legacy `Raw.pick_types` and `Epochs.pick_types` in favor of `.pick(...)`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e985c8ea0208`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.