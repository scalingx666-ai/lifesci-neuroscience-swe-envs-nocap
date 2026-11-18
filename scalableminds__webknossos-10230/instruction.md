# Issue

**Title:** Make LRUCache for HDF5 files actually evict by LRU

## Description

### Summary
- LRU caches for HDF5 and agglomerate files now evict least-recently-used entries instead of oldest-inserted. That’s just a boolean argument for the LinkedHashMap.
- Fun fact, despite being named LRUConcurrentCache, it never actually did LRU since its creation in 2016.
- Most of our code uses the more robust and async AlfuCache by now but for HDF5 files it’s hard to replace, so there this lives on.

### Steps to test:
- Load data with agglomerate file, should still work

------
- [x] Needs datastore update after deployment

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `612706f42305`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.