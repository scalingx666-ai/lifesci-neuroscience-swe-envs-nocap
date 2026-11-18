# Issue

**Title:** Add ecephys/icephys to physio/stim timeseries datatypes

## Description

Adds `ecephys` and `icephys` to the allowed datatypes for `physio`, `physioevents`, and `stim` suffixes, enabling physiological and stimulation files alongside microelectrode data.

Related to #2307

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `39ecbf210c46`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.