# Issue

**Title:** [FIX] CI runner for macOS

## Description

When using github action conda-incubator, the setup for mamba requires different options.

This was missed for the macOS runner in:  

This PR fixes the macOS runner with mamba.

 .

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9326804ac146`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.