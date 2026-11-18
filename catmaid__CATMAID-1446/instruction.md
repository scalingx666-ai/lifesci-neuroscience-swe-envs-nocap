# Issue

**Title:** Tracing overlay node list response caching

## Description

A dead simple, dumb cache for node queries that is invalidated by any and all modifying actions. Can finally jump back and forth a few sections @ 40 FPS without holding spacebar :tada:

Tiny branch, but submitting as a PR so @tomka can be the second set of eyes on the invalidation events as we discussed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0a73a7b1f763`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.