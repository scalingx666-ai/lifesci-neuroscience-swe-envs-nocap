# Issue

**Title:** MainGUI aux display fix

## Description

Display of aux data no longer assumes that time across aux channels is equivalent in length.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `07a2cbaa37fc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.