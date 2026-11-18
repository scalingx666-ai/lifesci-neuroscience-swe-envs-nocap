# Issue

**Title:** RF: Replace `config.execution.fmriprep_dir` uses in BIDSURI calls with `output_dir` parameter

## Description

.

## Changes proposed in this pull request

- Use `output_dir` function argument for `BIDSURI` objects instead of the `config.execution.fmriprep_dir` field. This will let other preps (e.g., ASLPrep) use these workflow functions without having to mock up `fmriprep_dir` fields in their config objects.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ea651967a942`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.