# Issue

**Title:** Add impedance mode check for EDF file type

## Description

Raises a ValueError if impedance mode is enabled with EDF file type, preventing unsupported recording configurations.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `967139218d6f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.