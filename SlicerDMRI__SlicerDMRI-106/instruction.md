# Issue

**Title:** BUG: fix crash in FB2LabelMap due to mismatched NumPy/VTK dtype size

## Description

NumPy defaults to 'long' on Windows, which is int32. Use a helper inside VTK which has the correct dtype for vtkIdTypeArray.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d495562123c0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.