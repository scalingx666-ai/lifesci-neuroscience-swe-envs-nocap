# Issue

**Title:** Wait for transfer threads before stopping an outlet's IO

## Description

Stacked on #313 (base: `fix/outlet-teardown-leak`). Fixes the connected-inlet part of #312 (fix **D** from the issue).

### Problem
With a connected consumer, a session's detached `transfer_samples_thread` could outlive the outlet's IO threads in three ways:
- blocked waiting on an `async_write` completion that `stop()` stranded;
- back in `pop_sample()` after consuming the wake-up sample from `end_serving()`;
- posting its final `sock_.cancel` (holding `keepalive`) to a context that had already stopped/drained.

The session then held its `io_context` and, after #313, the sample factory. That's about 16 MB plus an occasional thread leaked per outlet.

### Fix
- `close_inflight_sessions()` flags every in-flight session to abort **before** `end_serving()` pushes the wake-up sample.
- `tcp_server` counts live transfer threads. A thread decrements the count only after posting its final cancel, so the outlet's final drain (#313) runs that cancel.
- `~stream_outlet_impl` waits up to 2 s for the count to reach zero, **before** stopping the IO contexts, which still need to run to complete the threads' last writes.
- `handle_send_feedheader_outcome` doesn't start a transfer thread once teardown has begun.

### Second commit: servers and sessions no longer own the `io_context`
#313 had two workarounds for an ownership cycle: handlers in the `io_context` held `tcp_server`/`client_session`, which held the `io_context`. It ran stranded handlers after `stop()` and made sessions keep the sample factory alive. With transfer threads now waited for, this commit removes the cycle itself:
- `tcp_server` and `client_session` keep a plain reference to the `io_context`.
- The outlet destroys the context after the servers and before the factory (member order, now commented). Destroying it destroys anything `stop()` stranded, which frees the servers and sessions those handlers hold. Both of #313's workarounds are removed.
- The posted `stop()` handlers no longer capture their own context's `shared_ptr`. That was a smaller cycle of the same kind: on the forced-stop path, a queued stop handler kept its own context alive.
- If a transfer or IO thread hangs past its timeout, the outlet deliberately leaks the factory and the data context instead of freeing them while the thread may still use them (`ponytail:` comment).
- `testing/int/tcpserver.cpp`: the test helper now declares the context before the server, since the server only borrows it.

### Test
`testing/ext/outlet.cpp`: create an outlet, connect an inlet and pull one sample, destroy the outlet, then destroy the inlet; repeat 10×. Open fds must not grow. It fails 3/3 with #313 alone (`36 < 16`) and passes with this PR.

### Results (macOS arm64, 32 ch int16 @ 30 kHz, 10 cycles)
| Scenario | #313 alone | this PR |
|---|---|---|
| 1 connected inlet | +~16 MB/cycle | flat (~0.1 MB/cycle) |
| 3 connected inlets | +~18 MB, +~1.4 threads/cycle | flat |
| consumer that stops reading | no crash | flat, no crash |

- Teardown time is unchanged (~30–35 ms). The wait itself took 0.5–1.6 ms in every scenario and never timed out.
- Destroying an outlet right after a burst delivers ~20/2000 samples, the same as on `dev`. Teardown already discarded queued samples before this PR.

With both commits, macOS ASan (with leak detection) and TSan are clean in both suites and all scenarios, and the exported suite reports 0 leaked bytes (`dev`: ~5.3 MB). The deliberate-leak path for a hung thread isn't covered by a test.

### Sanitizers (first commit, measured on the experiment branch: same logic plus debug logging)
- ASan: clean on macOS (Homebrew LLVM 23) and Linux aarch64 (GCC 14, Raspberry Pi 5), both suites and all scenarios. In the exported suite, leak detection reports ~5.3 MB of leaks from outlet construction on `dev` and 0 with #313 + this PR.
- TSan: clean on macOS and Linux aarch64 for both suites and all scenarios. The only reports were an existing lock-order inversion in `inlet_connection::try_recover`, which looks like a false positive (both orders happen under `recovery_mut_`).
- One existing inlet-side ASan finding turned up along the way: #314, fixed in #315.

`lsl_test_exported` passes. `lsl_test_internal` has only the `network.cpp:78` failure, which also fails on `dev` (macOS).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `182d6d3bf258`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.