# Issue

**Title:** Skip tests on external-service outages; versions in pytest header; fix runner-test ordering race

## Description

.

## What each issue needed

**#7910 — `test_concurrent_generator_reading` ordering race.** The runner's ordering guarantee is real and intact: `_ResultGenerator.send()` takes `send_lock` and returns `self.result_queue.popleft()` (`nonasyncrunner.py:97-99`), so results are handed out strictly in generation order however many threads contend. What raced was the *test's observation* of that order — `next()` and the subsequent `put()` into the shared queue were two unlocked steps, so a thread preempted between them let others enqueue later results first. That is the adjacent swap AppVeyor saw. The fix closes that gap with a test-side lock, and the original strict-order assertion is restored verbatim. Neither option in the issue was quite right — the runner needs no fix, and the assertion was not too strong; the test was measuring with an instrument that had a gap in it.

**#7911 — versions in the session header.** `datalad.conftest` already dumps `external_versions` at *teardown*; a CI failure is triaged from the top of the log. Three lines in `pytest_report_header` emit the same dump at session start. Rendered header in .

**#7912 — outages must not turn CI red.** `skip_if_no_network` now optionally takes the URL a test depends on, so `@skip_if_no_network(url=...)` gates on that host actually answering rather than on network at large. Used by `test_gitea` (`demo.gitea.com`) and `test_ria_http_storedataladorg` (`store.datalad.org`). Plus `test_ria_http_local_store`, a hermetic `ria+http` clone (~3s) built from the existing `_move2store` + `@serve_path_via_http`.

## The one production change

`BaseDownloader._handle_authentication` already reraises the original exception rather than prompting when the UI is non-interactive — but only under `if needs_authentication:`. The `needs_authentication is None` branch ("we did not know whether auth was needed", which is what a plain 403 on an unauthenticated URL hits) went straight to `_enter_credentials` and its `ui.yesno`. `yesno` lives on `InteractiveUI`, while `QuietConsoleLog` (`tests-noninteractive`) and `SilentConsoleLog` (`no-progress`) derive from `ConsoleLog` and lack it — so **any access-denied response in a non-interactive session died with `AttributeError: 'QuietConsoleLog' object has no attribute 'yesno'` instead of the `DownloadError` the docstring promises.**

The fix applies the same four-line guard to that branch. `ui.is_interactive` is exactly `False` for the backends missing `yesno` and `True` for `DialogUI`, so it is precisely the right condition:

| backend | `is_interactive` | has `yesno` |
|---|---|---|
| `ConsoleLog` / `QuietConsoleLog` / `SilentConsoleLog` | `False` | no |
| `DialogUI` | `True` | yes |

This matters for #7912 directly: without it the new gating only works for connection-level failures, since any 4xx would crash inside the credentials dialog instead of skipping.

## Notes for reviewers

**`@optional_args` was deliberately not used** for the new `url` argument, though it is the idiom for `skip_if`, `with_tempfile` and `skip_known_failure`. It treats a no-argument call as "decorating with arguments", so `skip_if_no_network()` would return a decorator instead of skipping — silently turning three existing guards into no-ops (`downloaders/tests/test_s3.py:42`, `downloaders/tests/test_http.py:355`, and `test_tests_utils_pytest.py:535` which asserts it returns `None`), plus breaking `test_ria_basics.py:608`'s `skip_if_no_network(f)(None)`. The existing `func=None` shape is kept, branching to a decorator factory only when `url` is given. `nonetwork` is still checked first, so a no-network run does no probing.

**`datasets-tests.datalad.org` is deliberately not gated.** A run of the network job hit a live outage of it () — that is datalad's own test infrastructure and is expected to be up, unlike the third-party services above.

**This started ~7x larger and was cut down.** The first draft grew its own external-service probing subsystem in `pytest_plugin.py` (a `web_reachable` fixture, module cache, lock, thread pool, two env vars), a hand-rolled dependency-version walker over `importlib.metadata`, and a session-scoped RIA-store fixture in a new `conftest.py`. Three independent reviews found most of it duplicated machinery datalad already has:

| Reinvented | Already existed |
|---|---|
| probe subsystem + `web_reachable` fixture (~205 lines incl. tests) | `skip_if_url_is_not_available()`, now reachable via `skip_if_no_network(url=...)` |
| `_get_dependency_versions()` over `importlib.metadata` (~45 lines) | `external_versions.dumps(query=True)` |
| session-scoped RIA fixture, new `conftest.py` (52 lines) | `_move2store()` + `@serve_path_via_http` |

Delegating the version dump is also *better* output: it includes `cmd:annex`, `cmd:git` and `cmd:bundled-git` — the versions that actually explain a datalad CI failure — and drops dev-extra noise plus the pytest plugins that pytest's own `plugins:` header already lists. It also follows CONTRIBUTING.md's rule to use `external_versions` for version handling.

**Deliberate deviations from the issues as written:**

- **#7912 asked for `pytest-rerunfailures`.** Not added — this repo already depends on `pytest-retry` (#7754) and the two conflict over the `flaky` marker; installing both would break the existing marks on `test_gitea`, `test_download_ftp` and `test_rerun_merges`.
- **#7912 asked for a session-scoped local-RIA fixture.** Not added — it would have re-implemented `_move2store`/`serve_path_via_http`, and a session-scoped `HTTPPath` holds an `os.environ` patch open for the whole session and bypasses the `datalad.tests.temp.dir` policy that the `/var/tmp/sym link` CI job exists to stress. The test itself is kept, built from the existing helpers.
- **#7911 asked for a `web_reachable` fixture and a `datasets.datalad.org` probe.** Superseded. `datasets.datalad.org` gated nothing — no test consumed it.
- `requests.exceptions.ConnectionError` is **not** added to `only_on`: pytest-retry matches exception types exactly, not by subclass, so it would not catch `ConnectTimeout`/`ReadTimeout`/`SSLError` regardless.

## Still open for the reviewer

Serializing the observation in #7910 means threads contend on the test's lock rather than entering `send()` simultaneously, so it no longer exercises *simultaneous* entry — it exercises the generator being driven by 100 threads in turn. The two are mutually exclusive: a global order cannot be observed without serializing the observation. Say the word and I'll add a separate test for the interleaving-safe invariants (no loss, no duplication, per-thread monotonicity).

## Validation

The #7910 race is far too rare to demonstrate by repetition (the issue saw 1 occurrence in 162 job logs; 0/150 here under full CPU load). It was isolated by widening the window instead — a single `time.sleep(0)` between `next()` and `put()`, forcing a GIL yield exactly where the preemption happens:

| variant | runs violating the strict-order assertion |
|---|---|
| unlocked (as it was) | **30/30** |
| lock-serialized (this fix) | **0/30** |

`test_concurrent_generator_reading` then passed **300/300** with all 4 cores saturated; the full `test_nonasyncrunner.py` is 25/25.

Also run: `datalad/downloaders/tests/` 32 passed / 20 skipped (covers the production change), `test_tests_utils_pytest.py` + `test_nonasyncrunner.py` 79 passed / 8 skipped, `test_ria_http_local_store` passing, and **both gated tests skipping for real** — the downloader fix means this sandbox's 403 on `store.datalad.org` now surfaces as `AccessDeniedError`, so that skip path is exercised here for the first time rather than erroring. `flake8` output is byte-identical to the base commit on every touched file; `isort` and `codespell` clean.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01D1Ph17Zr5JA3Q5oibnyymF

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `28dc8b165196`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.