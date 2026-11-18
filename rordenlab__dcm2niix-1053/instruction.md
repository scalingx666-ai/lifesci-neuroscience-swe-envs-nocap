# Issue

**Title:** WASM: batched WORKERFS reads (supersedes #1052)

## Description

Builds on #1052 (@alexrockhill's commits kept), rebased on development.

- Read-ahead follows dcm2niix's `FS.readdir` walk order; a cache hit advances it.
- Cache released after each run.
- An unreadable neighbour no longer fails the batch.
- Files over 8 MB bypass the cache (was 64 MB): bounds memory overshoot, faster.

Chromium, disk-backed Files, ms (development → this PR): convert dcm_qa_canon 8814→2292, dcm_qa_trt 11526→~4200; listSeries dcm_qa_trt 8710→3388. `npm test` passes.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `40a3ac05b907`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.