# Issue

**Title:** RF+TST: deduplicate create_sibling_ria, timeout tests, and rerun_merges setup

## Description

## Summary

Deduplication pass targeting the highest-value clones found by jscpd (37 clusters, 0.69% overall):

- 097e1c21f `RF: extract _parse_ria_url helper to deduplicate URL verification` — the identical try/except `verify_ria_url` + `url_path2local_path` block in `create_sibling_ria.py` (lines 341-354 and 500-513) is now a single `_parse_ria_url()` helper
- 7e087dbfa `TST: deduplicate timeout tests in test_nonasyncrunner` — `test_timeout_stdout_stderr` and `test_timeout_process` were 100% identical (36 lines); extracted shared `_TimeoutProtocol` and `_run_timeout_command()`; also fixed `test_timeout_process` to actually assert on process-level timeouts (`fd is None`)
- 8c88d7800 `TST: extract _setup_run_left_run_right helper in test_rerun_merges` — the 8-line merge-graph setup repeated across `test_rerun_left_right_runs` and `test_rerun_exclude_side` is now `_setup_run_left_run_right(path)`

### Skipped

RIA test setup duplication across `test_ria_basics.py` / `test_ria_git_remote.py` / `test_ora_http.py` (77 lines, 3 files) — the blocks vary enough in URL construction, layout versions, and extra parameters that a shared helper would need too many arguments and hurt readability.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `518b8ea0ede2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.