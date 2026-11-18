# Issue

**Title:** Python 3.8 support

## Description

This is a small downgrade (harmless as far as I can see) in how `tuple[Numbers.type]` annotations are written, with the goal of widening support to python 3.8, and current Google Colab kernels by transitivity.

Reference: https://stackoverflow.com/a/63460173

Sorry for the multiplicity of commits, I tried to catch all uses in advance but it was ultimately a trial-and-error back and forth.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `57e9409296e2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.