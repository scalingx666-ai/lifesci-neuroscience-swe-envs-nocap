# Issue

**Title:** Drain stranded IO handlers when destroying an outlet

## Description

Fixes the no-consumer case of #312 (fix **A** from the issue).

### Problem
`~stream_outlet_impl` posts `end_serving()`'s acceptor close and then posts `io->stop()`. Closing the acceptors queues the aborted `async_accept` completions **behind** the stop, so they never run. They hold `shared_from_this()` of the `tcp_server`, which owns the data `io_context`. That cycle leaks the server, the sample factory (~16 MB at 32 ch / 30 kHz), the send buffer, and the context with its 3 fds (reactor + interrupter), once per outlet.

### Fix
After the IO threads are joined, `restart()` + `poll()` both contexts so the stranded handlers run and release their references. The aborted accept handlers return immediately. If the threads time out and get detached, that path returns earlier, so `poll()` never runs alongside a detached `run()`.

**Second commit: sessions keep the factory alive.** Once A frees the server, a detached transfer thread can still hold a `consumer_queue` full of samples (for example, a consumer that stopped reading). Dropping those samples returned them to the already-destroyed `factory`, which segfaulted 3/3 with a stalled raw-TCP consumer. On `dev` this never happened only because the factory leaked. `client_session` now holds a `factory_p`, so the factory outlives every queued sample.

### Test
`testing/ext/outlet.cpp`: a POSIX-only test that creates and destroys 10 outlets and checks that open fds don't grow. It fails on `dev` (`36 < 16`) and passes with the fix.
`testing/int/tcpserver.cpp`: a raw client sends a streamfeed request, never reads, the outlet pushes 100k samples, then the outlet is destroyed. It segfaults 2/3 without the second commit (it's a use-after-free, so ASan catches it reliably) and passes with it.

### Results (macOS arm64, 32 ch int16 @ 30 kHz, repro from #312)
| | before | after |
|---|---|---|
| no consumer, per cycle | +16.1 MB | ~0 |
| connected inlet, per cycle | +18.6 MB, +1 thread | ~+16 MB, occasional thread |
| stalled consumer | no crash (factory leaked) | no crash |

The connected-inlet case is **not** fixed here. Its sessions are still stranded by the transfer-thread shutdown race described in #312 (fix D), and each stranded session now correctly keeps its factory alive instead of risking a use-after-free. That's being worked on separately.

`lsl_test_exported` passes. `lsl_test_internal` has 1 failure (`network.cpp:78`, socket cancel timing), which also fails on `dev` without this change.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fd6a915494d3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.