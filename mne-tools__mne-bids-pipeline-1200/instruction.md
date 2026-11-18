# Issue

**Title:** Work around ds003104 issue

## Description

Latest version is `1.0.1` but `1.0.0` at least downloads, so let's use that until the upstream issue is fixed. The changes are
```
1.0.1 2026-03-13
  - Fix MEGCoordinateSystem and HeadCoilCoordinateSystem
```
So I think we should be okay to use the older one.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b7b5a66f3610`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.