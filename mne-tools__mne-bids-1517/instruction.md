# Issue

**Title:** FIX: Fix CI docs-build timeout and flaky multiprocess lock test

## Description

## Summary
- Guard `make view` in the `build-doc` Makefile target with a `CI` environment variable check, preventing the Sphinx docs job from hanging on headless CI machines (fixes the `ci/circleci: docs-build` timeout on PR #1511 and all other PRs)
- Replace the fragile `time.sleep(2)` in `test_lock_refcount_multiprocess` with a polling retry loop (up to 10 seconds), fixing intermittent test failures on slow CI runners

## Test plan
- [ ] Verify `CI=true make build-doc` builds docs without attempting to open a browser
- [ ] Verify `make build-doc` (without CI env var) still opens the browser locally
- [ ] Verify `test_lock_refcount_multiprocess` passes consistently in CI

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `48518675421a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.