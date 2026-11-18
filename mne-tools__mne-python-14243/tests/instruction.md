# Issue

**Title:** Remove rotating dipoles capability from interactive dipole fitting GUI

## Description

The implementation was broken and I don't see a way to make it actually work. When computing the dipole timecourses with the MNE algorithm, either all dipoles are rotating (`loose=1.0`) or fixed (`loose=0`). Having some fixed and some rotating seems challenging to actually get working.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `772970f4fb4d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.