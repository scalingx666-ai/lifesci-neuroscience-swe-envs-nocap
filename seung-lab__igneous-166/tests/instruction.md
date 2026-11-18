# Issue

**Title:** feat(SkeletonTask): compute cross sectional area

## Description

Adds `cross_sectional_area=True` and `cross_sectional_area_smoothing_window=1` to `SkeletonTask`.

As of this writing, the xs3d module kimimaro uses is too slow to do a dense calculation (think: 8+ hrs per a task) but is fast enough to do it for sparse neurons (thousands of times less work).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a296eb43e52e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.