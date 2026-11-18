# Issue

**Title:** Hotfix: take over abandoned encryption claims

## Description

Silent hotfix (server only, one new column).
- A conversion claim its device has not renewed for 5 minutes is abandoned; another owner/admin's app takes it over instead of being refused every 2 minutes. Nothing is sealed before keys/init, so the takeover clears only what the abandoned key made (allow-list entries, token/grant/link wraps, shares) and the new claimer allow-lists again.
- A live claim is never taken, and a plain member cannot take one.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `014f57e7c1a6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.