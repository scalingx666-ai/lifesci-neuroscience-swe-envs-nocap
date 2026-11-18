# Issue

**Title:** [MRG] No support for multiple .dat files yet

## Description

There doesn't appear to be an easy fix currently -- better to do the formatless refactoring before fixing this.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `19620d974051`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.