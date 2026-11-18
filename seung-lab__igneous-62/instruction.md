# Issue

**Title:** feat(ContrastNormalizationTask): Specify lower/upper fraction separately

## Description

Backward compatibility maintained by allowing single float as well as tuple when passing `clip_fraction`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ed6cf71f9000`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.