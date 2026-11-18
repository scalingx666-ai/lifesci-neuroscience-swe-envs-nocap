# Issue

**Title:** CI: Speed up Python 3.13 tests — resolve numpy 2.x pre-built wheels

## Description

## Summary
.

## Problem
Python 3.13 CI install step takes ~2m50s (vs ~1s for 3.9–3.12) because numpy 1.26.4 has no cp313 pre-built wheel, forcing `uv sync` to compile numpy from source.

## Fix
- Add `numpy>=2.1; python_version>='3.13'` constraint — uv now resolves numpy 2.5.1 with cp313 manylinux wheels for Python 3.13, while keeping numpy 1.26.4 for 3.9–3.12.
- Constrain `brainles_preprocessing` optional dep to `< 3.13` since it pins `numpy<2.0`.

## Compatibility
No code changes needed — the only numpy usage is `np.count_nonzero()` in `brats/core/docker.py:348` and `np.ones()`/`np.zeros()` in tests, all fully compatible with numpy 2.x.

---

> **Important:** This PR is based on #158 and #159. Please review and merge those first.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `836d85b32aff`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.