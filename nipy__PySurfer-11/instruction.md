# Issue

**Title:** workaround: always cast floats in read_scalar_data to 64bit

## Description

otherwise leads to incorrect rendering (at least on Linux Debian)
and it is done directly in read_scalar_data so it is in effect for
add_contour_overlay as well as add_overlay

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `85d2e749e75c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.