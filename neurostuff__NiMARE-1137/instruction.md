# Issue

**Title:** Fix inclusive thresholds in decoder preprocessing

## Description

.

Changes proposed in this pull request:

- Treat values equal to `frequency_threshold` as positive in decoder preprocessing and pairwise group checks.
- Preserve ROI association's exclusion of features without positive annotations.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `872486ee47f6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.