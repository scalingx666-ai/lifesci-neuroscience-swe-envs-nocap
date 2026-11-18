# Issue

**Title:** Updated detrending command to prevent break when n_sync_channels=0.

## Description

When n_sync_channels = 0, the command

`detrended = detrend(tmp[:, :-n_sync_channels], axis=0).swapaxes(0, 1)`

reduces to 

`detrended = detrend(tmp[:, :-0], axis=0).swapaxes(0, 1)`

Since tmp[:, :-0] is empty, this results in an error. 

I have fixed this bug by introducing an if/else statement predicated on whether n_sync_channels > 0.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c09b7d5324d3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.