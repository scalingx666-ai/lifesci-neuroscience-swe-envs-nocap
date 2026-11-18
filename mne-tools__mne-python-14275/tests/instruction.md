# Issue

**Title:** Fix CircleCI caching

## Description

I noticed some of our CircleCI caches were being read as 16B. That's because they came from some run (probably a PR) where the dataset wasn't actually downloaded. This run saved the cache anyway as empty, and caches are immutable, so this empty cache persisted even once a `main` run downloaded the actual data (it couldn't overwrite the existing cache).

This fixes it by making it so that dataset caches are only saved when on a full run, and only restored on PRs for the data that will be used. This requires using a "trick" where we write a file saying "noop" or "real" based on whether or not the cache restoration should be a noop or real (has to be a file because CircleCI can only set cache keys using hashes of files, not env vars). Only the real caches get saved, the `noop`s will be misses (and that's fine).

I'll merge this with `[circle deploy]` and then we can see if it works properly on PRs and other scheduled runs! Changes drafted by Claude Opus 5 but reviewed and iterated a lot by me.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fa701be8835f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.