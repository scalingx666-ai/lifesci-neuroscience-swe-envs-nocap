# Issue

**Title:** RF/DOC: Parser defaults

## Description

Renders `fmriprep` proper defaults in the sphinx documentation.

A few drive-by changes:
- `--no-submm-recon` and `--no-msm` are now argparse.BooleanOptionalActions
- `--work-dir` default is set during argument parsing (to avoid rendering an arbitrary path when docs are built)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2263b64cbf9f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.