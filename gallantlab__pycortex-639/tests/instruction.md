# Issue

**Title:** TST harden headless tests against CI timeouts

## Description

The 20-minute job wall in run_tests.yml was getting close to the
ceiling (19m58s on a recent run) because every headless test waited a
fixed 10s for the WebGL viewer to be "loaded" before driving it.
Across ~26 browser sessions in the matrix, that adds up.

Replace the ad-hoc sleeps with an adaptive wait inside
``headless_viewer``: poll ``window.viewer.loaded.state()`` (a jQuery
Deferred whose resolution marks "CTM mesh downloaded + parsed +
setData done") and only yield the handle once it reports
"resolved". Tests that previously did ``time.sleep(10)`` right
after entering the context manager can drop the sleep entirely;
``save_views.save_3d_views`` skips its own fixed sleep on the
headless path for the same reason.

Add ``pytest-timeout`` with a 240s default so a single hung browser
session fails its own test instead of draining the whole job, and
bump the CI ``timeout-minutes`` to 25 to give some headroom for
matrix stragglers.

https://claude.ai/code/session_01SwRcFj8xoAY3Fv2TG9DXNs

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `28129b3e7b04`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.