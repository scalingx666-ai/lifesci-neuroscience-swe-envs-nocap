# Issue

**Title:** [MAR-2525] Separate expected I/O failures from defects

## Description

## Human summary

Encephalon now reports expected filesystem and SQLite failures separately from internal defects, and CLI errors no longer expose local paths or raw internals.

## Summary

- Classify only recognised filesystem and SQLite error shapes as `IO_ERROR`; unexpected defects now become `INTERNAL_ERROR` while preserving the original API cause.
- Add a CLI-safe error projection that redacts absolute paths, raw causes, stack fields, unsafe strings, and oversized diagnostics before writing stderr.
- Return CLI exit status 1 for internal errors while preserving exit status 2 for expected Encephalon errors.
- Keep repository-relative paths and stable detail fields in safe CLI output.
- Update fault-injection tests to model operational I/O failures with errno-shaped errors.
- Add regression coverage for `ENOENT`, `EACCES`, `ENOSPC`, `SQLITE_BUSY`, malformed SQLite shapes, `TypeError`, `RangeError`, CLI-safe projection, and cache-scope path redaction.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c608a27f59f8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.