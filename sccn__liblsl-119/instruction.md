# Issue

**Title:** Reset smoothing parameters after disabling postprocessing

## Description

PR for #117.

- Commit 1: add unit tests for postprocessing options
- Commit 2: Move out smoothing parameters and smoothing code into a separate class that can be re-initialized and tested easier
- Commit 3: reset postprocessing options when `set_options()` is called
- Commit 4: adjust samples_seen when flushing samples

There's one major changes: the number of encountered samples is only tracked while `proc_dejitter` is active. Previously, samples were counted and enabling dejittering afterwards re-used this sample counter and therefore assumed a larger number of timestamps had been used to update the dejittering parameters.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ddfa30136b13`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.