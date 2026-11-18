# Issue

**Title:** CI: Only save ExternalData cache on miss; add fallback restore-keys

## Description

## Summary

- **Only write the ExternalData cache when there was a miss.** The save step (and the preceding populate-from-build step) now carry a guard:
  ```yaml
  if: ${{ !cancelled() && steps.restore-externaldata.outputs.cache-hit != 'true' }}
  ```
  On an exact-key hit the store is already up-to-date; skipping the write avoids redundant I/O and conserves the 10 GB per-repo GitHub Actions cache quota. A `restore-keys` fallback hit still leaves `cache-hit='false'`, so a fresh save is written in that case.

- **Add a version-prefix fallback restore key.** After a `MAJOR.MINOR` version bump (e.g. `5.8` → `5.9`) the exact key `ExternalData-BRAINSTools-v5.9` doesn't exist yet. Without a fallback every runner would cold-miss and re-download all test data. The new `restore-keys` entry:
  ```yaml
  restore-keys: |
    ExternalData-BRAINSTools-v${{ steps.btversion.outputs.major_minor }}
    ExternalData-BRAINSTools-
  ```
  allows GitHub to fall back to the most recently saved cache from any prior version, reusing already-downloaded content-addressed objects.

## Test plan

- [ ] CI passes on Ubuntu (GCC) and macOS (Clang)
- [ ] On a run where the exact key already exists, the "Populate" and "Save ExternalData" steps should be skipped (check the Actions log — both steps should show "skipped")
- [ ] On a cold run (or after a version bump), both steps should run and the cache should be written

## AI disclosure

Change authored with Claude Sonnet 4.6 assistance.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7950857ff482`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.