# Issue

**Title:** refac: `MovieStim` wrappers

## Description

`MovieStim` now works with nearly all the movie backends we previously supported (except avbin), selectable through the `decoderLib` parameter. The PR refactors the older classes as wrappers for the new `MovieStim` class to provide support for movies in code still referencing the older classes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f37a8d37b950`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.