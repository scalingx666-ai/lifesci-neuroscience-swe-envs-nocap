# Issue

**Title:** webgl: bind an OS-assigned ephemeral port for the viewer server

## Description

## Summary

Split out of #659 — this is the **port half**. The other half (the interpreter-exit deadlock in `headless_viewer`) is in a separate PR; the two are independent and can land in either order.

`WebApp` chose its port with `random.randint(1024, 65536)` and bound it **asynchronously** on the server thread via `server.listen(port)`. When the random port was already taken, `listen()` raised `OSError: [Errno 98] Address already in use` on that thread and died silently, while `server.start()` had already returned. The caller then pointed its client at a port whose server never came up, so `server.get_client()` blocked for the full timeout. This is the unhandled thread exception that showed up in [run 29051424261](https://github.com/gallantlab/pycortex/actions/runs/29051424261/job/86232825486) alongside the `RuntimeError: Failed to establish WebSocket connection ... within 60 seconds`.

**Fix:** bind the listening socket **synchronously** in `WebApp.__init__` via `bind_sockets(0)`, letting the OS hand out a guaranteed-free ephemeral port (read back into `self.port`). Bind failures now raise **in the caller**, visibly, instead of dying on the server thread; the pre-bound socket also removes the connect race (the OS backlogs connections before the IOLoop starts). `show()` now requests port 0. As a side benefit, many simultaneous viewers are collision-free — each holds its own kernel-reserved ephemeral port for its lifetime.

### `stop()` safety, required by the above

Binding in `__init__` means `stop()` has to be safe against a server that hasn't finished starting: it reads `self.server` / `self.ioloop`, which `run()` sets on the server thread, so an early `stop()` could hit an `AttributeError`, be lost entirely, or leak the bound sockets if the server never started. (This is the point .)

`run()` now sets a readiness `Event` once those attributes exist; `stop()` waits on it (bounded, short-circuited by `is_alive()`) before stopping the server + loop, and closes the bound sockets itself if the server never came up. This is kept in the same PR because it exists solely to make the `__init__`-time bind safe — landing the bind without it would knowingly reintroduce the leak.

Also drops the now-unused `import random` in `view.py` and corrects the `port` docstring, which still promised a random port from 1024–65536.

## Testing

Exercised the real `WebApp` directly (standalone, since a full `cortex` import needs `h5py`/Chromium not present in the dev sandbox):
- `port=0` binds a real ephemeral port synchronously and the server serves HTTP on it.
- An explicit in-use port raises `OSError` (errno 98) **synchronously in the caller** — no silent thread death.
- 30 viewers constructed concurrently from threads got 30 distinct ports — zero collisions.
- Every `stop()` path — normal serve→stop, never-started→stop (closes the socket, no leak, returns immediately), and 30× concurrent start+immediate-stop — is clean with no errors.

`ruff check` on the touched files reports the same 18 pre-existing findings as `main` — no new ones.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `537f05ef4674`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.