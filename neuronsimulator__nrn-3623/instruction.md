# Issue

**Title:** In yml files `key: value` requires a space after the `:`

## Description

Just a missing space causing a ```Invalid workflow file: .github/workflows/windows.yml#L44```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ab2c33984a82`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.