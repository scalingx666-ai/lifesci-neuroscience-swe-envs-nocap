# Issue

**Title:** refactor(datasets): ponytail shrink summary table synthesis and audit debt markers

## Description

Aggressively simplifies summary table synthesis in `moabb/datasets/base.py` (-128 net lines) and ensures all `# ponytail:` markers include upgrade triggers.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f8f8cf81c997`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.