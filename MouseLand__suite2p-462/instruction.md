# Issue

**Title:** Readme fix

## Description

Small PR that contains the following: 

- changes in readme and docs that point users to use console script entry point `suite2p` (works great!) instead of `python -m suite2p`
- change variable names for main cli script to make args/default vars clearer
- Fixed bug with main CLI script not correctly setting boolean parameters that have defaults to `True`. For instance, if you pass `--nonrigid 0` nonrigid wouldn't ever be changed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `801bc797adcb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.