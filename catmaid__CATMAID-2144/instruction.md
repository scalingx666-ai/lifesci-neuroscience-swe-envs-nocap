# Issue

**Title:** tools: extend dateToString, add nullish

## Description

- dateToString fix/extension
  - stop mixing UTC and locale-aware methods ()
  - allow custom separators, useful for timestamping filenames (`:` is difficult on windows, ` ` is generally difficult)
- Add function something like nullish coalescing
- Unit tests for both

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `09078153c908`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.