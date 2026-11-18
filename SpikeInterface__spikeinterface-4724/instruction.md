# Issue

**Title:** Fix `n_jobs=-1` oversubscribing cores under CPU affinity restrictions

## Description

This PR
- adds `get_usable_cpu_count()` in `job_tools.py`, preferring `os.process_cpu_count()` (Python >= 3.13, cross-platform affinity-aware) or `os.sched_getaffinity()` (older Python on Linux) and falls back to `os.cpu_count()` when neither is available
- adds unit test for `get_usable_cpu_count()`
- uses `get_usable_cpu_count()` everywhere `n_jobs` was previously resolved from `os.cpu_count()`
- updates tests to compute their expected boundary values with  `get_usable_cpu_count()` 
- additionally fixes the order of installation in deepinterpolation CI workflow as installing spikeinterface was silently reupgrading numpy to 2.x which breaks tensorflow's complied extensions
- additionally fixes a pre-existing test-order-dependency bug in `test_fix_job_kwargs`: `set_global_job_kwargs` merges via `dict.update()` and can't remove keys, so the manual "restore" step that uses `set_global_job_kwargs` left `chunk_memory` key in `global_job_kwargs`. The fix uses `reset_global_job_kwargs()` following the same pattern in `test_globals.py`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dbe2e7539ab6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.