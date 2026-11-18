# Issue

**Title:** [MNT] Import private namespaces if scipy > 1.8.0

## Description

This pull request fixes the import statements for functions in private namespaces in scipy. Private namespaces where renamed in scipy 1.8.0 to distinguish them from public ones (see ). I fixed the import statements appropriately and used a try/except statement so that the toolbox still works with scipy < 1.8.0

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `503d9ade5af5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.