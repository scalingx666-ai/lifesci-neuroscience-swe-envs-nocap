# Issue

**Title:** perf: cut TUI startup from ~20s to ~0.15s (lazy-import litellm + IPv4-first)

## Description

## Summary

`graybox.cli` startup currently takes **~20s** because importing it pulls in litellm, whose own import does a blocking network fetch of its model-cost map (and hangs ~20s on networks without routable IPv6). This PR makes importing the CLI ~**0.14s** — a ~150x speedup.

## Changes

Two commits:

1. **`perf: lazy-import LLM modules for fast startup`** — litellm and its ~900 modules are no longer imported at module level. They load only when a command actually needs the LLM (`organize`/`ask`/`chat`/`dupes`/`merge`/`edit`/`delete`/`refresh`).
2. **`perf: prefer IPv4 and local cost map in litellm startup`** — two fixes applied before litellm is imported:
   - Reorder `getaddrinfo` results so IPv4 is tried first (avoids the ~20s hang on broken-IPv6 networks).
   - Set `LITELLM_LOCAL_MODEL_COST_MAP` so litellm's bundled local cost map is used instead of a network fetch.

## Verification

- `python3 -c "import time; t0=time.time(); import graybox.cli; print(time.time()-t0)"`
  - before: **21.5s**
  - after: **0.13s**
- 245 tests pass.

## Why

The interactive TUI (`graybox.cli` with no args) is the primary way people run Gray Box. Waiting ~20s for a splash screen that doesn't even use the LLM is a poor first impression and unnecessary work.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `519197933bbf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.