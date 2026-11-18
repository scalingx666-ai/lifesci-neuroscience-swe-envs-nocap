# Issue

**Title:** Place cell plotting bug fix (1D)

## Description

Added a `.gitignore`, to automatically ignore cache files.
Fixed a bug in `PlaceCells.plot_place_cell_locations()`: it was assuming that place cell centres were 2D, and breaking for a 1D environment.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1f859e39dab1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.