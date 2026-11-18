# Issue

**Title:** [MAR-2533] Harden artifact path portability

## Description

## Human summary

Artifact paths now reject more Windows-incompatible names and overlong path parts before records are written.

## Summary

- Extend the Windows reserved-name predicate to reject superscript COM/LPT device basenames, case-insensitively and with extensions.
- Apply a portable path-component limit of 255 UTF-8 bytes and 255 UTF-16 code units to record IDs, kinds, and every artifact segment.
- Preserve the existing aggregate 1,024-byte artifact path limit and all other unsafe path checks.
- Add table-driven API tests for ordinary and superscript reserved artifact names plus ASCII and multibyte component length boundaries.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `59736d8d0d32`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.