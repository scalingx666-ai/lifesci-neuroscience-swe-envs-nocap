# Issue

**Title:** [WIP] Tweaks for quick start

## Description

- Built-in PRB files can now be specified by their names from the PRM file.
- `--pdb` CLI argument to activate the IPython debugger in post-mortem mode.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `da1566492d41`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.