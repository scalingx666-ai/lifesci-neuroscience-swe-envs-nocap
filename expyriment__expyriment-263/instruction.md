# Issue

**Title:** `int(round(x))` → `round(x)`

## Description

* The built-in `round()` readily returns an int.
* Avoid hiding the built-in `round()` as this is confusing.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `653a1cc3138c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.