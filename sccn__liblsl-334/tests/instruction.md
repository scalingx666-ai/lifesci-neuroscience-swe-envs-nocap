# Issue

**Title:** Support 1-sample consumer queues

## Description

`consumer_queue` is a Vyukov-style bounded MPMC queue, which needs at least 2 slots (with 1, an occupied slot and a slot that is free for the next round have the same sequence number). A 1-sample queue is reachable through the public API: an inlet's buffer is rounded up to at least 1 sample (e.g. `transp_bufsize_samples` with `max_buflen=1`, or a slow stream), and any client can send `Max-Buffer-Length: 1` in a streamfeed request.

- **Debug builds** aborted on `assert(size_ > 1)` (#158). Reproduced with the new test.
- **Release builds** didn't crash but corrupted the queue: after 3 pushes, `read_available()` reported 3 samples in 1 slot.

**Fix:** a 1-sample queue uses 2 slots, and `push_sample()` drops the queued sample before pushing, so it holds exactly the newest sample. That's the meaningful behavior for "buffer 1 sample" (e.g. always getting the latest value), and other sizes are unchanged except for one extra branch per push.

**#156:** `data_receiver` checked `max_buflen < 0` only after creating the queue with it, where a negative value becomes a huge allocation. The check now runs first.

**Tests:** new `consumer_queue of one sample` test (fails in release, aborts in debug without the fix). Release: `[queue]`, all internal (except the macOS-flaky "streambuf cancel connect()") and all 49 exported tests pass; Debug: `[queue]` passes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `01fca412ce22`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.