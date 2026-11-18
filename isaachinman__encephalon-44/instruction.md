# Issue

**Title:** [MAR-2546] Make gate recovery ownership token-safe

## Description

## Human summary

Corrupt cache-lock recovery can no longer overlap or delete another process's recovery marker, even when recovery is delayed, ownership changes, or cleanup fails.

## Summary

- Treat a valid live recovery owner as owned regardless of marker age, while retaining bounded recovery for dead, malformed, oversized, or ownerless markers.
- Revalidate the captured directory identity and random owner token immediately before every recovery action, successful gate initialisation, reclaim, and cleanup.
- Preserve one total acquisition deadline and stable `CACHE_BUSY` behaviour across initial and retried SQLite gate contention.
- Bound and validate owner metadata, including JSON shape, byte size, timestamp/token lengths, and supported PID range.
- Prevent cleanup failures from entering the protected operation, while allowing only the exact abandoned in-process identity and token to be reclaimed on a later call.
- Add deterministic ownership-loss, replacement, deadline, cleanup, malformed-owner, and real cross-process contention coverage.
- Document the maintained recovery and atomic-publication contract.

Linear: https://linear.app/marcoappio/issue/MAR-2546/locking-make-gate-recovery-ownership-token-safe

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b39371ebe458`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.