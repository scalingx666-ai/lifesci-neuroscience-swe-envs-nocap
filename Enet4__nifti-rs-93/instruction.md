# Issue

**Title:** Use try_reserve to allocate volume/extended data

## Description

- add error variants `ReserveVolume` and `ReserveExtended`
- Allocate the whole block at once
   - with `try_reserve_exact`, so it doesn't panic

#92 @nilgoyette

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `376b8f1a3b70`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.