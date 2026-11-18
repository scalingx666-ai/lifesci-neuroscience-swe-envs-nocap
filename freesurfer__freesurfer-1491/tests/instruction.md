# Issue

**Title:** move babyseg to cli wrapper

## Description

Changes required to move mri_babyseg to a CLI call which is then added to the pipeline instance in infantfs. mri_babyseg command is only built if the infant module is turned on.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8cca7d3120d0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.