# Issue

**Title:** Report details of failed buckets to Airbrake

## Description

### Summary
When buckets of a batch fail in the pull queue, the error only said "Some buckets could not be handled." and was only logged to the console. Now:
- Each failed bucket records its reason: a failure response from the datastore, or the error caught while handling the received data.
- These details (layer, bucket addresses, reasons, first caught error incl. stack) are attached to the thrown `BucketBatchError`. The first caught error determines its message and is set as `cause`.
- The error is reported to Airbrake. Each message is reported only once per pull queue, because failed buckets are retried and would otherwise exhaust the per-session error limit.
- Errors of the whole request (e.g., network errors) are still only logged to the console.

### Steps to test:
- CI (adapted `pullqueue.spec.ts`)
- Optionally: throw in `PullQueue.handleBucket` locally and check that the console shows the error together with the bucket details.

------
- [x] Removed dev-only changes like prints and application.conf edits

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5a5f0ec10ccc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.