# Issue

**Title:** BF(TST): add signal_timeout helper and bound test_gin_cloning

## Description

## Summary

Follow-up to merged #7851. After that PR, `test_gin_cloning` was still observed failing in CI as:

```
FAILED ../datalad/core/distributed/tests/test_clone.py::test_gin_cloning
  - Test passed but took too long to run: Duration 417.43355967900004s > 60.0s
```

i.e. the test passed but the CI-wide `--fail-slow=60` (`.github/workflows/test.yml`) flipped the report to `failed` after the fact. The earlier `@flaky(only_on=[IncompleteResultsError])` cannot catch that — the call has already succeeded by the time `pytest-fail-slow` rewrites the outcome in `pytest_runtest_makereport`.

## Fix

Add a generic `signal_timeout(seconds)` helper to `datalad/tests/utils_pytest.py` (alongside the existing `@slow`/`@turtle`/`@integration` markers) and wire `test_gin_cloning` to use it.

### `signal_timeout(seconds)` (datalad/tests/utils_pytest.py)

`@contextmanager` that arms `signal.SIGALRM` (via `signal.setitimer`, so sub-second budgets work) and raises a plain `TimeoutError` from inside whatever syscall the block is in once the budget is exceeded. No-op on platforms that lack `SIGALRM` (notably Windows).

Sits alongside the trio of related but distinct primitives in this codebase:
- `@slow` / `@turtle` / `@integration` — *selection* tags, do not enforce time
- `@pytest.mark.fail_slow(N)` — *budget reporter*, lets the test run to completion then flips outcome to failed
- `signal_timeout(N)` — the only one of the three that can actually **interrupt** a running test

Designed to pair with `@pytest.mark.flaky(only_on=[…, TimeoutError])` from `pytest-retry`, so an environmental hiccup is retried rather than red-flagged on first attempt.

### Why not `pytest-timeout`

Considered but not adopted. As of pytest-timeout 2.4.0:
- The `signal` method calls [`pytest.fail(...)`](https://github.com/pytest-dev/pytest-timeout/blob/ddabc934535081a5bf9ba7c9ca5b494aeaf8f665/pytest_timeout.py#L502) which raises the generic `_pytest.outcomes.Failed`. Adding `Failed` to `@flaky(only_on=...)` would retry on every assertion failure — too broad.
- The `thread` method (used on Windows) calls [`os._exit(1)`](https://github.com/pytest-dev/pytest-timeout/blob/ddabc934535081a5bf9ba7c9ca5b494aeaf8f665/pytest_timeout.py#L542). The process dies and no exception escapes — retry plugins cannot intervene at all.

A search of `pytest-dev/pytest-timeout` issues + PRs (as of 2026-05-07) found no open feature request for a dedicated exception class to enable retry-plugin filtering. The closest hit is , closed without proposing one.

The full rationale and permalinks are captured in the `signal_timeout` docstring so the next person evaluating pytest-timeout adoption finds it.

### `test_gin_cloning` (datalad/core/distributed/tests/test_clone.py)

- 50 s budget — comfortably under the 60 s `--fail-slow` ceiling, so any single successful attempt cannot trip it.
- `@flaky(retries=3, delay=5, only_on=[IncompleteResultsError, TimeoutError])` — covers both the form `clone()` wraps the alarm into when SIGALRM fires inside its threaded runner, and bare `TimeoutError` when it fires during the post-clone assertions / `ds.get(...)`.

## Test plan

- [x] **7 parametric unit tests** in `datalad/tests/test_tests_utils_pytest.py` for `signal_timeout`: under-budget, zero-cost block, tight-over, clear-over, clean-exit disarm, user-exception disarm, and SIGALRM-absent no-op fallback. All pass locally in 0.58 s.
- [x] **End-to-end retry behaviour** verified locally by patching `signal_timeout` to a 1 s budget in-process: `pytest-retry` retries exactly `1 + retries=3 = 4` times before failing, with both `IncompleteResultsError` and `TimeoutError` covered by `only_on`.
- [x] Pre-commit hooks (isort, codespell, trailing whitespace) pass.
- [ ] CI: confirm a healthy `test_gin_cloning` run still passes within the 50 s budget (it normally takes well under that).

## Follow-up (not in this PR)

A rollout plan for further `signal_timeout` adoption is staged locally at `.git-meta/SIGNAL_TIMEOUT_ROLLOUT.md` and will be promoted into a tracking issue. Tier A candidates are the four sibling `datalad/distributed/tests/test_create_sibling_{github,gin,gitea,gogs}.py` tests, which mirror this fix's shape exactly. Tier B (case-by-case: `test_install.py`, `test_http.py`, `test_gitrepo.py`, …) and Tier C (already-`@slow` tests, local-fixture tests, runner stall-detection tests — explicitly excluded) are also enumerated there.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8244357ec9a7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.