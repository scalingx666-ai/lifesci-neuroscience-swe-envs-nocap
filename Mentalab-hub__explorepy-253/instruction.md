# Issue

**Title:** Sentry ignore errors

## Description

Do not log KeyboardInterrupt, FileExists and DeviceNotFound errors in sentry

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dd4d15b3f0eb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.