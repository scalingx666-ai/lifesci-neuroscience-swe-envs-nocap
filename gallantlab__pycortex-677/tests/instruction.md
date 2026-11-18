# Issue

**Title:** webgl: fix interpreter-exit deadlock in headless_viewer

## Description

## Summary

Split out of #659 — this is the **exit-deadlock half**. The other half (the random-port fix in `serve.py`/`view.py`) is #676; the two are independent and can land in either order.

`headless_viewer` awaited the WebSocket `"connect"` on a `ThreadPoolExecutor` worker running `server.get_client()`, which blocks on a `threading.Event` with no timeout. `cancel_futures=True` can't cancel an already-running future, so on a failed connection the worker parked forever — and `concurrent.futures` joins every worker at interpreter exit, wedging the process after the work was already done.

In CI this was the 25-minute `timeout-minutes` guard firing ~15 min after pytest had already printed its summary ([run 29051424261](https://github.com/gallantlab/pycortex/actions/runs/29051424261/job/86232825486)).

**Fix:** await the client on a **daemon** thread. Daemon threads are never joined at exit, so a stuck getter can never hold the process hostage. The join is bounded by the same `timeout`, and teardown sets `server.connect` so the getter unblocks promptly rather than lingering across sessions.

Note this only removes the *hang*; a genuinely failed connection still raises the same `RuntimeError` with the captured browser errors, just without wedging the interpreter afterwards. The underlying cause of those failed connections is what #676 addresses.

## Testing

The predecessor #658 carried this same fix (plus the first half of the port fix) and went green across the full `run-tests` matrix (Python 3.10–3.14) with no hang and no timeout. `ruff check cortex/export/headless.py` passes clean.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `537f05ef4674`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.