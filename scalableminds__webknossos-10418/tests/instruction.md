# Issue

**Title:** Transfer buffer from fetch_buffer.worker and document why the fetch workers exist

## Description

### Summary
- `fetch_buffer.worker` (used for mesh chunks and `receiveArraybuffer`) now transfers its buffer instead of structured-cloning it, which saves one full copy per response on the main thread. `fetch_buffer_with_headers.worker` (bucket loading) already did this.
- Comments in both workers explain why they exist. They don't offload CPU work, because `fetch`/`arrayBuffer()` are native. Their benefit is that the main thread handles one message per request instead of two promise resolutions (headers, then body). That only matters when the main thread is saturated.
- The history contains a benchmark page (`/benchmark/fetch`), which is reverted in the next commit. To rerun the measurements, revert that revert commit. Results with 300 requests of 6 uint8 buckets each, 6 in parallel:
  - Chrome with 0 ms and Firefox with 10 ms of simulated work per frame: no difference (main thread was slightly faster).
  - Chrome with 30 ms of work per frame: workers ~20% faster in total (≈1640 ms vs. 2040 ms), with p95 request latency of ≈35 ms vs. 65–100 ms.
  - Frame timing was the same in all modes, so the workers don't improve UI responsiveness.

### Steps to test:
- Open a dataset and check that buckets and meshes still load.

------
- [x] Removed dev-only changes like prints and application.conf edits

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `df867e90d348`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.