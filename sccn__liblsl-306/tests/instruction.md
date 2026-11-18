# Issue

**Title:** Fix idle synchronous consumer disconnect detection

## Description

Synchronous outlets currently retain disconnected consumers until a sample write fails. This makes an idle outlet keep returning true from `have_consumers()` and allows `wait_for_consumers()` to accept a stale connection.

Check synchronous sockets for peer-close/read readiness when querying consumers, and remove ended feeds under the existing socket-write mutex. Use zero-timeout `poll` on POSIX and `select` on Windows. The feed is one-way after the handshake, so incoming data also ends the feed, matching the asynchronous watcher. This preserves native blocking mode and the existing send-timeout mechanism.

Cleanup is on demand through consumer queries, not proactive background cleanup. No IO worker or asynchronous operation is added to synchronous sockets.

. Follows #291.

## Validation

- Confirmed the idle-disconnect regression fails on the pre-fix synchronous path while the asynchronous path passes.
- Extended idle disconnect, disconnect during production, close/reopen, and one-of-two-consumer tests to both transport modes. Added coverage for `wait_for_consumers()` rejecting a stale connection without sample pushes.
- macOS arm64 Debug: focused `[outlet],[open],[reopen],[sync]` suite passed **1,741 assertions across 20 cases**.
- Xcode 27 / Apple Clang 21 ThreadSanitizer: the same focused suite passed with no warnings.
- 100 repeated disconnect-during-production runs, each exercising both transport modes: all functional assertions passed, no timeouts. Eighteen runs reported the separate sample-recycling warning tracked in #305 and exited unsuccessfully under TSan. No other sanitizer reports were observed; this is not a fully TSan-clean stress result.
- `git diff --check` passed.

Windows and Linux behavior still needs CI validation. The socket mode is unchanged by this implementation; a dedicated blocking-send-timeout regression was not run locally.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3ddedd085f94`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.