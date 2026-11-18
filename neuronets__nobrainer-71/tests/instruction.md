# Issue

**Title:** install pkgs from pip + update cudnn version

## Description

- Install latest `pip` using `get-pip.py` script.
- Install all packages with `pip`
- Update CUDNN version. CUDNN version must be checked against the version in tensorflow's dockerfile.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `938839c1750c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.