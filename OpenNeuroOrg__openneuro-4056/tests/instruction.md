# Issue

**Title:** perf(cli): Batch index adds instead of staging one file at a time

## Description

## Problem

`annexAdd` stages each file with its own `git.add`, and isomorphic-git
re-serializes and rewrites the entire index on every call. Staging is therefore
O(n) per file and O(n²) overall.

On a 185k-file dataset the rate fell from ~300 files/min to ~30 files/min by 83k
files, projecting roughly four more days of staging before any transfer started.

## Change

Collect paths and stage them in batches of 500. `annexAdd` no longer calls
`git.add` itself; it returns `true` and the caller batches. `git.add` already
accepts an array, so no upstream change is required.

## Measurement

isomorphic-git 1.36.3, 20,000 files, local NVMe:

```
per-file add    1173.3s    rate decays 8840 -> 541 files/min   (rate x n constant)
batched (1000)     6.1s    rate flat, ~180k files/min
```

192x faster, and the rate no longer decays. Confirmed in production on a 185k-file
dataset: ~200 files/min and falling became ~1200 files/min and steady.

## Testing

- `deno test` — 36 passed, 0 failed
- `deno fmt --check` and `deno lint` clean on the changed files
- Ran the end-to-end worker test with `ADD_BATCH_SIZE` set to 1, 2 and 500 to
  exercise both the multi-flush and single-flush paths. All produce an identical
  repository — that test asserts an exact git object count, so a staging error
  would surface.

## Note for review

With batching, up to `ADD_BATCH_SIZE - 1` files can be staged on disk but not yet
recorded in the index if the process dies mid-run. Staging is idempotent so a rerun
redoes them. 500 is a compromise between that window and the per-flush cost; the
benchmark is already flat by ~2000 files, so a smaller batch would cost nothing
measurable if you would prefer a tighter bound.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `28eb0007a336`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.