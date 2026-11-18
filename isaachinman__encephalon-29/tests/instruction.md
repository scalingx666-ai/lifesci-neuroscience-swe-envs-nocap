# Issue

**Title:** [MAR-2532] Validate kind directories directly

## Description

## Human summary

Validation now catches invalid or colliding Encephalon kind folders even when those folders are empty.

## Summary

- Validate every non-reserved kind directory with the same portable kind predicate used for record envelopes.
- Report stable directory-level issues for invalid kind names and case/Unicode-normalization collisions.
- Preserve existing record path mismatch checks for records inside scanned directories.
- Add cross-platform tests for portable kind predicates, empty invalid directories, host-supported case/normalization collisions, invalid directories containing records, and valid empty custom kinds.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4ea28a7bd691`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.