# Issue

**Title:** [ENH] add templates bids_validator

## Description

could build an image with a dockerfile generated with the following

```bash
neurodocker generate docker --pkg-manager apt --base-image ubuntu:jammy-20221130 --bids_validator version=1.13
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b496ce7d9b66`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.