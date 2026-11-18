# Issue

**Title:** NMODL: make v, celsius, and dt available in VERBATIM

## Description

This fixes a minor difference between nocmodl and nmodl-transpiler.

In nocmodl the variables "v", "dt", and "celsius" are available in verbatim blocks, even if they are not declared anywhere else in the file.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fe165ebc4c07`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.