# Issue

**Title:** [MAR-2562] Confine cache filesystem access

## Description

## Human summary

Cache access is now confined to the verified repository cache. Replaced files, links, and SQLite sidecars are detected before they can redirect reads, writes, recovery, or clean-up.

## Summary

- Centralise cache path and filesystem identity validation in one cache-location authority.
- Reject symlinks, junctions, unexpected entry types, and repository or cache replacements throughout initialisation, reads, writes, locking, and recovery.
- Verify SQLite databases and sidecars before and after open, preserve the operation gate across WAL-mode contention, and quarantine only the exact corrupt cache identity observed.
- Keep public API and CLI behaviour unchanged while sanitising new filesystem failure details.
- Add adversarial race, corruption, recovery, sidecar, cross-process contention, and error-projection coverage.
- Update the maintained cache-safety contract and user-facing cache description.

Linear: https://linear.app/marcoappio/issue/MAR-2562/cache-prevent-symlink-escape-through-cache-roots-and-sqlite

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aedb5a4a538e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.