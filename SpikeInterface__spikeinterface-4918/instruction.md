# Issue

**Title:** Use ast.literal_eval instead of eval in parse_sinaps_meta

## Description

## What
`parse_sinaps_meta()` (extractors/sinapsrecordingextractors.py), reached via `read_sinaps_research_platform`, parsed each `key=val` line of a SiNAPS `metadata_*.txt` file with `eval(val)`, which executes code from the metadata file. This replaces `eval` with `ast.literal_eval`, which still parses the values (floats, tuples) but cannot execute code.

## Why
 (the `read_python` exec fix) — same class: a metadata/config value should be parsed, not executed.

## Changes
- `eval(val)` → `ast.literal_eval(val)` (+ `import ast`). Legit metadata parses unchanged; a value like `__import__('os').system(...)` is no longer executed — it stays a string, which the existing `except` already handles.

## Note
I used Claude Code as an assistant to investigate and prepare this fix; I reviewed the change before submitting.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4e28d878e240`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.