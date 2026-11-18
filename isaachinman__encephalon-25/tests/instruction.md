# Issue

**Title:** [MAR-2528] Bound baseline scanner traversal

## Description

## Human summary

Baseline scanning now has deterministic traversal bounds and avoids following symlinked workflow ancestors or package manifests.

## Summary

- Replace recursive language scanning with an iterative bounded queue.
- Cap scanned regular files, visited directories, traversal depth, and accepted entries per directory.
- Add deterministic `scanTruncationReasons` metadata to generated repository-overview records.
- Read `package.json` through a no-follow descriptor with a same-descriptor regular-file and size check.
- Verify `.github` and `workflows` directory ancestors independently before enumerating workflow filenames.
- Add regressions for per-directory truncation, depth truncation, and symlinked `.github` ancestry.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fce78a81eb19`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.