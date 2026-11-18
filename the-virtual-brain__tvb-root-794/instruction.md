# Issue

**Title:** backend: CUDA parameter-sweep backend (resubmission of #793)

## Description

## What this is

Re-submission of the CUDA parameter-sweep backend (commit `e2b0d17a4`, originally part of the `hybrid-numba` split as PR #793) against `master`.

PR #793 was merged on 2026-09-16 with base branch `hybrid-5-demos` instead of `master`, so the CUDA sweep content never reached trunk. This PR re-lands the identical change (5 new files, +4333 lines, no modifications to existing files) on top of current `master` (`3d6c5a9c4`, which already contains PRs #786–#792 of the hybrid split).

## Content

- `tvb_library/tvb/simulator/backend/nb_hybrid_cuda_sweep_backend.py` — CUDA parameter-sweep backend
- `tvb_library/tvb/simulator/backend/templates/nb-hybrid-sweep-cuda.py.mako` — sweep kernel template
- `tvb_library/tvb/simulator/backend/templates/nb-zerlaut-sweep-cuda.py.mako` — Zerlaut sweep template
- `tvb_library/tvb/tests/library/simulator/backend/test_nb_hybrid_cuda_sweep.py` — sweep tests
- `tvb_library/tvb/tests/library/simulator/backend/test_nb_hybrid_cuda_parity_regression.py` — CUDA/CPU parity regression tests

All files are additive; no existing file is touched, so there is no conflict surface with recent trunk work.

## Tests

Requires a CUDA-capable build (numba CUDA). On CPU-only runners the new test modules should be skipped cleanly; GitHub CI's CPU jobs must remain green.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3d6c5a9c4273`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.