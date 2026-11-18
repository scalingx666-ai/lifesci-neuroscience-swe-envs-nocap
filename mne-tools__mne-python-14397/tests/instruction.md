# Issue

**Title:** ENH: Add drop_channels method to DigMontage

## Description

this PR was aided by gemini 3.8 flash

- Fixes mne-tools/mne-python#13386

Adds a `drop_channels` method to `DigMontage` (matching `Raw.drop_channels`), allowing dropping channel positions and corresponding EEG digitization points in place. Also refactors `remove_fiducials` to share the private `_remove_dig_points` helper.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `874535799172`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.