# Issue

**Title:** Remove UI code

## Description

- [x] Removed all IPython/UI-related code.
- [x] Refactor waveform/session bindings so that the UI can easily bind VisPy and IPython views on the session
- [x] on_select: pass selector instance
- [x] waveform view: no more cluster metadata but pass colors directly

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a322ecb9ee73`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.