# Issue

**Title:** Autoproofreader

## Description

Add autoproofreader to KNOWN_EXTENSIONS.
To use the extension just pip install it into your django environment, run migrations and collect static

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `865019a4ecaa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.