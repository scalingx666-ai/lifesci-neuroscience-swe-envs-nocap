# Issue

**Title:** Default boolean_op for skeleton_raw_info

## Description

- If argument not given, default to "OR"
- Capitalise user's input
- Explicitly check for "AND"/"OR" and raise ValueError

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dd0a00389918`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.