# Issue

**Title:** MAINT: DRY BIDSPath.match and find_matching_paths

## Description

A small start toward #1559: make `BIDSPath.match` use `find_matching_files`. These had almost the same code in them, so route one through the other.

First commit (just pushed) uses the alternate code path, and asserts the two give the same files. (It also exposes that `tracking_systems` was missing from `find_matching_paths`!) Once this comes back green, I'll remove the old code path in favor of the new one.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bd0c1fa8b3d4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.