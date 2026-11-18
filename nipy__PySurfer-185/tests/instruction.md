# Issue

**Title:** [MRG] FIX Brain.remove labels()

## Description

Remove the `hemi` parameter, which was previously unused (even though it forced the user to set it). Labels are not stored by hemisphere, but by their name.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `86481141fc37`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.