# Issue

**Title:** [MAR-2517] Separate cache reader and writer connections

## Description

## Human summary

Cache reads now use read-only SQLite connections, while cache rebuilds use writer connections, so ordinary lookups cannot initialise or mutate the cache database.

## Summary

- Split cache opening into separate reader and writer paths with a bounded SQLite busy timeout.
- Keep PRAGMA and schema setup on writer connections while reader connections only validate existing schema and freshness.
- Route recoverable reader-open cache failures through one locked rebuild while preserving repository-scope mismatch errors.
- Add coverage for fresh read-only reads, writer-path rebuild recovery, SQLite lock waits, and bounded reader timeout errors.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fad71329ace6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.