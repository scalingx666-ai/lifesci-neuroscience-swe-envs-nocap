# Issue

**Title:** Fix inlet reception after close and reopen

## Description

Closing an inlet previously left its receiver thread joinable and its connected flag set. Reopening could return successfully without restarting reception, and unread samples survived the close.

This change joins the cancelled receiver, clears its queue and connected state, and permits both explicit `open_stream()` and implicit opening through a pull call. Intentional close no longer enters recovery or marks a non-recoverable inlet as lost. Thread startup is serialized with close, including cancellation before socket registration. Close wakes the reconnect back-off and interrupts concurrent open calls with a timeout_error identifying the interruption; a close generation preserves that result even if another open follows immediately.

Because recovery can wait indefinitely for a missing outlet (or for another inlet component's recovery lock), the data receiver now supplies a cancellation flag. Recovery lock acquisition uses a timed mutex, and recovery resolution polls that flag without permanently cancelling the shared resolver, allowing subsequent reopening and metadata retrieval.

Regression coverage includes repeated close/reopen, both opening modes, recovery enabled/disabled, unread-buffer disposal, repeated close before opening, immediate close during connection setup, closing during recovery with and without a metadata request holding the recovery lock, and waking concurrent open waiters with and without immediate reopening. Tests use unique source IDs and repeat samples to avoid depending on the separate readiness race in #176.

Validation on macOS:

- Universal x86_64/arm64 build, including benchmarks, succeeds.
- New regression test fails against the pre-fix library; the lifecycle cases pass (73 assertions across four test cases).
- Exported suite passes with benchmark cases excluded (2,250 assertions across 37 cases).
- Internal suite passes: 34 cases pass and one existing case fails as expected (969 assertions total).
- Dedicated bad-interface, machine-local, TCP, and query-port resolver suites pass.
- AddressSanitizer build succeeds, but its runtime stalls before `main` during shadow-memory initialization on this machine; no sanitizer result is claimed.
- Windows and Linux execution will be checked by CI.

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `19c439f4528e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.