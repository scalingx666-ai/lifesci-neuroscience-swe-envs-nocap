# Issue

**Title:** Extract algor param from the config file

## Description

The sepia GUI now returns the variable `h` for controlling the GUI externally. The `algorParam` data is parsed from the SEPIA config file and returned in the UserData container of the figure handle in `h`. The new code just adds functionality, it doesn't change any existing functionality.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `59661a8d49e6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.