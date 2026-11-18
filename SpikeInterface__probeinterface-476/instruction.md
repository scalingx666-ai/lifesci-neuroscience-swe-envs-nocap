# Issue

**Title:** Parse .prb with ast instead of exec in read_prb

## Description

## What
`read_prb()` (io.py) parsed a .prb file by `exec()`-ing its contents. .prb files are probe-geometry definitions (a `channel_groups` dict) that are routinely shared, so reading one executed whatever was in it. This replaces the `exec` with a small `ast`-based parser (literals + `range()`/`list(range())` with integer args) and ignores everything else.

## Why
Same class as the SpikeInterface `read_python` fix (reported privately; Alessio agreed). We don't need to exec a .prb since it's a simple dictionary.

## Changes
- `read_prb()` rewritten to parse via `ast` (no `exec`). A normal .prb parses unchanged; a .prb with e.g. `import os; os.system(...)` is no longer executed.
- Added a regression test (`tests/test_read_prb_safe.py`).

## Note
I used Claude Code as an assistant to investigate and prepare this fix; I reviewed the analysis, the change, and the test before submitting.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7a743872c865`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.