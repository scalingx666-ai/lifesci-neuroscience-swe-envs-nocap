# Issue

**Title:** [MAR-2519] Make SQLite gate the lock authority

## Description

## Human summary

Operation locking now trusts the SQLite gate instead of stale PID metadata, avoiding false lockouts when a process ID has been reused.

## Summary

- Make the SQLite `BEGIN IMMEDIATE` gate the documented authority for operation serialization.
- Treat any `operation.lock` directory seen after acquiring the SQLite gate as orphaned metadata.
- Recover malformed disposable gate databases by removing gate files and retrying acquisition.
- Make directory-lock release and candidate cleanup best-effort so cleanup failures do not mask operation outcomes.
- Add regression tests for reused live-PID owner metadata and malformed gate database recovery.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f25efe42c361`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.