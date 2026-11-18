# Issue

**Title:** download: Openneuro overwrite=False skips instead of repairing files on disk

## Description

## Why
`openneuro-py` re-verifies the size/hash of every file already on disk on each run and repairs mismatches **in place**. On a plain resume (`overwrite=False`) that means a download can silently mutate data already on disk.  — this change was authored alongside it but didn't make the squash-merge.

## What
- `Openneuro._download`: when `overwrite=False` and the target already holds data, skip `on.download` entirely. `openneuro-py` only runs for a fresh (empty) target or when `overwrite=True` forces a re-verify/repair.
- Add `_has_local_data()` helper (ignores the success marker so a bare marker doesn't count as data).

## Trade-off
With `overwrite=False`, a partially-downloaded target is treated as complete; use `overwrite=True` to resume/repair.

## Test plan
- ruff / mypy clean on `neuralfetch/download.py`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `286c4e46fded`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.