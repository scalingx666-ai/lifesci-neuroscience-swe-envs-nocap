# Issue

**Title:** NF+BM: extend create_test_dataset spec, add save/run benchmarks on heavy hierarchies

## Description

## Summary

- Extracted from #7821 (which will be pushed rebased on top of this) so that we could
  - use those benchmarks in comparison for that PR
  - minimize that PR to relevant changes (already enough)
 
What it does:
 
- Extend `create_test_dataset` spec syntax with `+Nf` suffix (file count per level), `d` prefix (plain directories instead of subdatasets), and `--nfiles` parameter
- Add ASV benchmarks for `save` and `run` on realistic dataset hierarchies (10 annex subdatasets × 1000 files each)

### `create_test_dataset` enhancements

Backward-compatible extensions to the spec syntax:

```
2+100f      2 subdatasets with 100 files each
d3+50f      3 plain directories with 50 files each
10+5f/d4+100f   10 subs (5 files) each with 4 dirs (100 files)
```

New `--nfiles` parameter sets default file count per dataset (default 1).

### Benchmarks (`benchmarks/save_run.py`)

| Benchmark | Description |
|-----------|-------------|
| `save_clean` | Standard save, 50 files (regression guard) |
| `run_simple` | End-to-end run on lightweight dataset |
| `save_heavy_hierarchy` | Recursive save on 10 subs × 1000 files, changes in 2 |
| `run_heavy_hierarchy` | run() touching 2 of 10 heavy subs |

Heavy benchmarks use `setup_cache` with tarball for fast per-invocation setup.

## Test plan

- [x] All 6 existing `test_create_test_dataset` tests pass (backward compat)
- [x] New spec syntax tests added (`+Nf`, `d` prefix)
- [x] All benchmarks verified locally via `asv run -E existing`
- [x] if CI passes, I will not delay merge to `master` to facilitate further work on that original PR

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8a8d49dd4987`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.