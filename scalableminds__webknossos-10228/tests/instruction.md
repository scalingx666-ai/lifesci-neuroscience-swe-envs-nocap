# Issue

**Title:** Switch id reservation mutex to per-annotation async queue

## Description

### Summary
 - The old mechanism blocked the call thread for the full wait. With many callers this could even exhaust the pool.
 - The new mechanism serializes per annotation via queued futures. The result is the same, but with no blocked threads.

### Steps to test:
- Annotate some with othersMayEdit=true

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0f8fa80cd97b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.