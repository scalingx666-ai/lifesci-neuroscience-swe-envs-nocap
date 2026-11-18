# Issue

**Title:** Remove a couple of unnecessary bundled dependencies

## Description

- `configobj` is not used anywhere
- `argparse` is present in the standard library from Python 2.7 onwards

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `35a5f5205ba2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.