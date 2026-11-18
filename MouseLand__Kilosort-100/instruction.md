# Issue

**Title:** Sim noise model

## Description

Small fixes to learnAndSolve8b to allow sorting of low electrode count data.

Add option to model frequency spectrum and channel correlation of noise on real data in eMouse simulator.

Improved efficiency of eMouse simulator by using only gridded interpolation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4991ceba3cd4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.