# Issue

**Title:** [MAR-2526] Report committed add failures explicitly

## Description

## Human summary

When a record is already committed but cleanup or cache work fails afterward, Encephalon now says so clearly instead of hiding the committed record state.

## Summary

- Define hard-link publication as the canonical record commit point for add operations.
- Report post-commit publication-flush, staging-cleanup, and cache-hydration failures as `IO_ERROR` with `canonicalCommitted: true`, record ID, repository-relative path, failed phase, and recovery action details.
- Keep cleanup failures from replacing more important publication-flush or cache-hydration failures.
- Preserve deterministic retry behaviour: the canonical file remains present and retrying the same add returns `RECORD_EXISTS`.
- Add CLI coverage showing committed post-commit failures are emitted in structured stderr with safe relative details.
- Add recovery coverage proving a later `prepare()` rebuilds disposable cache state without deleting the committed record.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8e45938e84db`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.