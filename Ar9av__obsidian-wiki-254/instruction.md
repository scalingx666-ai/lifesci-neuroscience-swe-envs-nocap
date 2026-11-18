# Issue

**Title:** perf(cache): resolve manifest entries once in check_sources

## Description

## Problem

`check_sources` (the `cache-check` command) is O(entries × queries) in filesystem work. It matches each queried file with a linear scan over all manifest entries calling `_same_source`, then sweeps every unmatched entry against every query again. Since #217 stores machine-portable (relative) keys while `cmd_cache_check` absolutises the query, `_same_source`'s string fast path never fires and every comparison does `stored_path.resolve() == query.resolve()` — two `realpath` walks (an `lstat` per path component) per pair.

Measured on a 3,329-entry manifest: 1 file 0.31 s, 30 files 30.4 s, 150 files 32–63 s. cProfile of the 30-file call: 759,213 `Path.resolve` calls = 27.8 of 30.4 s. A delta script checking 1,554 files in batches of 150 spent 5 m 18 s here, 100 % of its runtime; batch size cannot help because the total is entries × files however it is chunked.

## Change

Resolve each entry once and index it by its forms (raw key, resolved path); resolve each query once and look it up; drive the missing/unavailable sweep from the index instead of a second entries × queries loop.

Semantics are unchanged:

- a query matches an entry by raw key or by resolved path, as `_same_source` did;
- the **first** entry matching by either form wins, as the scan's `break` on first hit did (`setdefault`, then `min` over the hit indices);
- unmatched entries that are duplicates of a scanned path (any form) are still not reported missing;
- `os.path.normcase` keeps resolved-path comparison equivalent to `Path` equality on case-insensitive filesystems;
- `update_source` and `_same_source` are untouched.

## Verification

- Full suite: 1088 passed, 4 skipped.
- Two new tests in `TestCheckSources`: `Path.resolve` is called O(entries + queries) times on a 2,300-entry manifest with 300 queries (was ≈ 2 × 2,300 × 300); first entry wins for duplicate forms and the duplicate is not reported missing.
- On the real 3,329-entry manifest, the same 150 files: buckets identical to the released command; 32.1 s → 0.12 s. All 1,554 files of one source tree: 0.32 s (was 5 m 18 s in 11 batches).

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `59fa4b216c24`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.