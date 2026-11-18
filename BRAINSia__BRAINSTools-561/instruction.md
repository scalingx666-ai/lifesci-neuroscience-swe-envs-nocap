# Issue

**Title:** PERF: Add ccache, ExternalData store, and SuperBuild EP caching to CI

## Description

## Summary

Six incremental improvements to `.github/workflows/build.yml` that reduce CI wall-clock time from ~60–90 min cold to ~5–15 min warm, prevent disk exhaustion on Ubuntu, and improve build reproducibility.

## Changes (one commit each)

| # | Commit | Change | Est. savings |
|---|--------|--------|-------------|
| 1 | `7ddc818` | `actions/checkout` v4 → v5 (EOL Node.js 16 → 20) | Correctness |
| 2 | `3c02cfb` | `pip` cache on `actions/setup-python` | ~5–15 s |
| 3 | `526f38d` | `BRAINSia/free-disk-space@v2` before build on Ubuntu | Prevents disk OOM |
| 4 | `1c624b6` | ccache via `CMAKE_C/CXX_COMPILER_LAUNCHER`; remove `-march=native` | **80–95% of compile time** |
| 5 | `1c664ad` | ExternalData object store cache via `ExternalData_OBJECT_STORES` (versioned by MAJOR.MINOR) | ~30–120 s/run |
| 6 | `790817a` | SuperBuild EP install prefix + done-stamp cache (keyed on `SuperBuild/**` hash) | **30–60 min/run on cache hit** |

## Key design decisions

### ccache + `-march=native` removal
`-march=native` causes ccache misses across heterogeneous runner instances (different Xeon generations on ubuntu-latest get different instruction sets → different cache keys). Removing it makes the cache portable and does not affect test correctness.

### ExternalData: MAJOR.MINOR versioning
The cache key includes the project MAJOR.MINOR version parsed from `CMakeLists.txt`. This means:
- **Within a minor version** (patch fixes, code changes): cache hits, no re-download
- **On a minor version bump** (new test data): key prefix changes, fresh download, new objects stored
- **SHA suffix** on the save key: new `.sha512` hash files added mid-version are accumulated incrementally
- New objects downloaded each run are copied back from the cmake binary root to the persistent store

### SuperBuild EP cache
Caches the EP install prefix (`build/BRAINSTools-Release-<version>/`) and the ExternalProject done-stamp directories. ExternalProject_Add skips all steps for an EP when its done-stamp is present. EP intermediate build trees (~5–10 GB) are **not** cached — ccache handles recompilation in seconds. Cache is only saved on a miss (no cost when current).

## Test Plan

- [ ] First run (cold cache): full SuperBuild runs, all 6 caches populated
- [ ] Second run (warm cache): EP phase skipped, ccache hits on ExperimentalBuild, ExternalData objects served from store
- [ ] After `SuperBuild/External_ITKv5.cmake` GIT_TAG bump: EP cache key changes, EP rebuilt and re-cached
- [ ] After `VERSION 5.9.0` bump in `CMakeLists.txt`: ExternalData key prefix changes, fresh download

## AI Disclosure

CI analysis and workflow implementation by Claude Sonnet 4.6. Cache key design and ExternalData integration reviewed against BRAINSToolsExternalData.cmake and GitHub Actions cache documentation.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6609f1b51ff6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.