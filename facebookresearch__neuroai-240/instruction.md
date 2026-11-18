# Issue

**Title:** Fix timeline infra in chains

## Description

## Problem
`Study.model_post_init` decided `timelines.infra` at construction, dropping the
per-timeline backend whenever no folder had resolved yet. A Study inside a Chain
gets its folder propagated *after* construction, so the backend was silently
discarded: timelines loaded sequentially and uncached, with no warning.

## Fix
`Study._body()` makes the choice when the body is used, returning a memoized
inline variant instead of assigning `timelines.infra`. Assignment would break on
frozen trees, and would alter the `exclude_defaults` dump and trip the uid
collision check; a variant keeps the dumped config exactly as validated.
Cache folders are unchanged: `timelines` is excluded from the Study uid and
`infra` from the loader's, so all `timelines.infra` settings share one tree.

## Checklist

- [x] Tests added or updated
- [x] Docstrings updated for any changed public APIs
- [x] `pytest` and `mypy` pass locally

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5f3a13a63f48`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.