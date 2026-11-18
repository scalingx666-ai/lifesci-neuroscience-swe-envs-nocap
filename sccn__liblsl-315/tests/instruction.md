# Issue

**Title:** Use io_context::run() so cancellable_streambuf never leaves a handler pending

## Description

.

### Problem
On cancel, `connect()`, `underflow()` and `overflow()` left their hand-written `do run_one() while (!cancel_issued_ && ...)` loop as soon as `cancel_issued_` was set, leaving their async operation's handler queued. The `underflow()` and `overflow()` handlers capture `&bytes_transferred_` (a stack variable), so the next `run_one()` (e.g. the flush in `~cancellable_streambuf`) wrote into a dead stack frame. It also wrote a stale `ec_` that the new operation then took as its own result.

### Fix
Replace the three loops with `as_context().run()`. `run()` returns only once the context is out of work, i.e. once the operation's handler has run. `cancel()` already posts the socket close into the same context, so a cancel makes the pending operation complete promptly with an error. That's 3 fewer lines in `src/` than `dev`, plus a comment explaining why `run()` matters here.

(An earlier version of this PR added a `run_until_complete()` helper that re-implemented `run()` by hand; it was replaced after review.)

### Test
"Closing during connection setup permits reopening" now runs 500 open/close cycles instead of 20 (≈0.1–0.3 s), so a cancel during setup is likely. Under ASan, against `dev`:

| Platform | 20 cycles | 500 cycles |
|---|---|---|
| macOS arm64 (clang 23) | 1/40 runs | 7/40 runs |
| Linux aarch64 (GCC 14, Raspberry Pi 5) | 10/10 | 10/10 |

More cycles don't help on macOS (2000 cycles: 8/40).

### Results with this PR
| | `dev` | this PR |
|---|---|---|
| Stress harness (2000 cycles/process), macOS ASan | 15/100 stack-use-after-return | 0/100, reopen OK 100/100 |
| Stress harness, Linux aarch64 ASan | 30/30 | 0/30 |
| Updated test, Linux aarch64 ASan | 10/10 | 0/10 |
| Stress harness, macOS TSan (5 × 1000 cycles) | — | 0 warnings |

- Exported suite under ASan passes with no errors on macOS and Linux aarch64.
- Normal build: `lsl_test_exported` passes. `lsl_test_internal` has only the `network.cpp:78` failure, which also fails on `dev` (macOS).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `42118f80ff92`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.