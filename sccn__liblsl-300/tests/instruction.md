# Issue

**Title:** Ensure outlets are ready when open_stream returns

## Description

A sample pushed immediately after `open_stream()` returned could be lost: the inlet had already received the handshake, but the outlet's handshake-completion callback had not yet registered its consumer.

Register the asynchronous consumer queue before sending the feed header. The write callback owns the queue until it can pass it to the transfer thread; a failed handshake releases it. Sample transmission still starts only after the header write completes, preserving wire ordering and the existing zero-buffer handshake behavior.

For synchronous outlets, send the header under the existing sample-write lock and register the socket before releasing that lock. This prevents an immediate push from missing the socket or overtaking the handshake; the configured synchronous send timeout also applies to this write.

The regression test opens a fresh inlet and immediately pushes exactly one sample, with no sleeps, `wait_for_consumers()`, or retries. It covers 30 connections each for asynchronous numeric, synchronous numeric, and string streams.

Validation on macOS:

- The regression test fails against the pre-fix library on its first trial.
- All 90 connections pass with the fix (183 assertions).
- Universal x86_64/arm64 build succeeds, with benchmarks enabled.
- Internal suite passes: 34 cases pass, one existing case fails as expected (969 assertions total).
- Exported suite passes with benchmark cases excluded: 2,365 assertions across 35 cases.
- Windows and Linux execution will be checked by CI.

Based directly on `dev`; independent of #299. .

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e0e2fe1f3150`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.