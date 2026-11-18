# Issue

**Title:** chore: ignore build artifacts and venv; trim tvb_library/.gitignore

## Description

## What

Part **1/7** of the `hybrid-numba` split series (see `handoff-hybrid-split.md` in the working tree for the full plan). This PR is repo hygiene only:

- root `.gitignore`: ignore build artifacts and virtual environments
- `tvb_library/.gitignore`: trimmed

2 files, +9 lines. No production or test code.

## Why it is separate

It was the first logical unit of the long `hybrid-numba` branch. Kept apart so the review of the substantive PRs (framework, models, backend, sweep, demos, CUDA) is not mixed with noise.

## Order

Independent — merges cleanly on its own and in any order relative to the rest of the series.

## Verification

Green by construction (no code changes).

## Series

| # | Branch | Status |
|---|--------|--------|
| 1 | `hybrid-0-support` | **this PR** |
| 2 | `hybrid-1-framework` | open |
| 3 | `hybrid-2-models` | open |
| 4 | `hybrid-3-backend` | after #2 + #3 merge |
| 5 | `hybrid-4-sweep-cpu` | after #4 merges (stacked) |
| 6 | `hybrid-5-demos` | after #4 merges |
| 7 | `hybrid-6-cuda-sweep` | after #4 merges |

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c713d0962953`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.