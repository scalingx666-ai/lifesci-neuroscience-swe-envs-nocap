# Issue

**Title:** Detect superseded shmem segments via per-creation segment_uid

## Description

## Problem

`ShmemSession::isOwnerAlive()` rejected stale NATIVE CLIENT segments using only `owner_pid`. That check is blind when a **persistent service** owns the shared memory.

Concretely, Orion (`orion/src/device/CereLink.cpp`) is one long-lived process. Its `disconnect()` → `m_session.reset()` cleanly destroys the STANDALONE `ShmemSession` (running `shm_unlink`), and each `connect()` recreates the device's segments under the same name. Across every start/stop cycle `owner_pid` stays equal to Orion's PID, so `isOwnerAlive()` always reports "alive" — even for a segment that belongs to a session that was closed and superseded. A CLIENT holding the old mapping has no way to tell it is stale.

## Fix

Add a per-creation `segment_uid` to `NativeConfigBuffer`, stamped by the STANDALONE owner at creation. `isOwnerAlive()` now applies two checks:

| Failure mode | detected by |
|---|---|
| Persistent owner recreated the segment under the same name | `segment_uid` mismatch (new) |
| Owner crashed without unlinking | `owner_pid` dead (existing) |

Both are needed — the PID catches the crash-orphan case (uid unchanged), the uid catches supersession (pid unchanged). A zero `segment_uid` or `owner_pid` skips that check for backward compatibility with pre-liveness segments.

`readCurrentSegmentUid()` re-opens the segment name and reads the uid of whatever it resolves to *now*, comparing against the uid in our mapped buffer.

### Why a token, not an inode

The natural identity would be the segment inode, but **macOS returns `st_ino == 0` for POSIX shm fds** (verified), so inode is unusable there. `segment_uid` is a portable token: `steady_clock` stamp ^ pid ^ process-local atomic counter (never 0), stored in the buffer and read back by mapping the re-opened segment on both platforms.

## Out of scope

`isOwnerAlive()` is a **one-shot check at attach** (`sdk_session.cpp` ~814). A client that attaches to the current segment and is superseded *while streaming* won't notice until something re-checks. That periodic liveness poll belongs in the client (pycbsdk/sdk_session) and is intentionally deferred — tracked in a separate issue.

## Tests

New `OwnerLivenessTest` cases: `StandaloneWritesSegmentUid`, `ClientDetectsUnlinkedSegment`, `ClientDetectsSupersededSegment`. `cbshm_tests`: 104/104 pass; full project builds clean.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f4f79f139e6c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.