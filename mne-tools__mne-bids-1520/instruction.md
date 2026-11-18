# Issue

**Title:** FIX: Detect and autofix missing underscore separators in get_entities_from_fname

## Description

## Summary
- Detect filename segments with multiple hyphens (e.g., `task-ECONrun-1`) that indicate missing underscore separators between BIDS entities
- Add `on_error='autofix'` mode that warns and applies unambiguous fixes (e.g., `task-ECON_run-1`)
- Existing modes (`raise`, `warn`, `ignore`) also benefit from improved multi-hyphen detection

## Test plan
- [x] Parametrized tests for `warn`/`autofix`/`raise`/`ignore` modes across multiple filenames
- [x] Three-entity merge detection (`sub-01task-ECONrun-1`)
- [x] Non-fixable segments preserve best-effort parsing
- [x] Repeated malformed segments produce correct progressive suggestions
- [x] No false positives on valid filenames (including compound extensions like `.nii.gz`, `.tsv.gz`)
- [x] `ruff check` and `ruff format` pass

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `eab64963a384`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.