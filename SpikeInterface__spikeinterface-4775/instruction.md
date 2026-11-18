# Issue

**Title:** Prepare 0.104.9 release with sortingview fixes

## Description

Includes:

- Sortingview/Figpack: transpose templates (for `sortingview`) and cast to `float32` to avoid serialization issues
#4774

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `76c41846f88d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.