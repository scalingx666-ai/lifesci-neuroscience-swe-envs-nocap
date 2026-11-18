# Issue

**Title:** fix: make exclude_automorphisms respect constraints and cycles

## Description

exclude_automorphisms was treating negative edges and differently-constrained nodes as symmetric and dropping matches on rotations like the 3-cycle, so this matches on the full constraints and swaps the pairwise filter for grochow-kellis symmetry breaking, .

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3ce616089ad5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.