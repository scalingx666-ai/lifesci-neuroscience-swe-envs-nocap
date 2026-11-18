# Issue

**Title:** updated ANT neuro wrapper

## Description

- Impedances are not read for bipolar channels, so they should not be in the list of resistance_channels.
- To be sure that emg_channels are not filled with garbage from in EEG mode, the whole package is filled with zeros before filling with data.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `78fab43f3564`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.