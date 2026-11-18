# Issue

**Title:** Reduce dev backend memory usage

## Description

### Summary
Lowers the memory `yarn start-backend` uses, and makes the JVM give unused memory back to the OS.

- Heap starts at 256 MB and is capped at 4 GB (was 8 GB).
- A G1 periodic GC runs after 60 s idle, and the heap shrinks closer to live data after each GC (`MinHeapFreeRatio=10`, `MaxHeapFreeRatio=30`). String deduplication is on.

A clean full compile (util, datastore, tracingstore, webknossos) with a 3 GB cap needed at most ~860 MB of heap and ~1.75 GB RSS, so 4 GB leaves room for the running app and Play dev-mode reloads.

**Affected commands:** only `start-backend` (and thus `start`). The `sbt --client` commands (`build-backend`, `test-backend`, `fix-backend`, …) attach to that sbt server when it's running and get the same settings; when they start their own server they keep sbt's defaults. CI is not affected.

### Steps to test:
- `yarn start`, use WEBKNOSSOS for a while, check the backend works and the sbt JVM's memory drops back down when idle (Activity Monitor)

------
- [x] Removed dev-only changes like prints and application.conf edits

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4081858c7c95`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.