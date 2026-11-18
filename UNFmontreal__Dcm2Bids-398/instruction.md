# Issue

**Title:** [Hotfix] Include data package in the actual build

## Description

During the change to pyproject.toml, we forgot to include data package for the BIDS schema .JSON. 
Thanks to author of #396 for highlighting it, this will fix it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6773b544f274`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.