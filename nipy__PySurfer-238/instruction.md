# Issue

**Title:** MRG: Add units kwarg

## Description

This PR:

1. Adds `units` kwarg for `mm` or `m` with tests and modified examples to show it works
2. Fixes bug where `distance` wasn't always respected in `show_view` (because there are two ways to supply it)
3. Removes `Surface.save_geometry` because 1) it's unlikely that it was used in production code by users, 2) it's not used in `PySurfer` at all (not even in tests) and 3) it's really duplicating `nibabel` functionality without adding much.
4. Removes two parameters that have been deprecated for 3 years.

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e8a087924f49`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.