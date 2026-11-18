# Issue

**Title:** Work around HDF5 ros3 shutdown deadlock on Windows CI

## Description

## Summary

This is an upstream HDF5 defect, filed at  This PR is a CI-side workaround so the jobs go green while this is resolved upstream.

Backing the workaround out once HDF5 ships the fix is tracked in #2231.

## Changes

- `scripts/test_ros3.py`: runs `test.py` as a child process; once the child reports its exit code via `PYNWB_EXITCODE_FILE` but fails to exit, terminates it from the parent (which is not subject to the loader-lock deadlock) and propagates the reported code. A no-op on platforms that exit cleanly.
- `test.py`: writes its computed exit code to `PYNWB_EXITCODE_FILE` when that env var is set, before `sys.exit`.
- `run_all_tests.yml` / `run_tests.yml`: the ros3 jobs run through the wrapper; `run_all_tests.yml` ros3 jobs also get `timeout-minutes: 20` as a backstop.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f3073cc6acd4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.