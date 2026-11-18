# Issue

**Title:** Release v0.2.0 — aligned_lambdas (#94) + version bump + changelog

## Description

Final release PR.  with a real API and bumps the version.

## What's new in this PR

###
The MATLAB sqrt(N) cap mentioned in #94 was already fixed in #142. This PR adds the second piece — proxy lambdas for aligned gradients:

- `procrustes(..., return_transform=True)` returns the rotation matrix.
- `procrustes_alignment(..., return_transforms=True)` returns per-dataset rotations.
- `ProcrustesAlignment` now exposes `transforms_`.
- New helper `aligned_lambdas(lambdas, transform)` implements the largest-|transform[i,j]| heuristic suggested by @OualidBenkarim in the issue thread.
- `GradientMaps.aligned_lambdas_` is populated automatically when `alignment='procrustes'` is used.

### Release v0.2.0
- `_version.py` → 0.2.0
- `CHANGELOG.txt` rewritten with a full inventory of changes since 0.1.22: issues #66, #94, #98, #112, #136, #140 plus packaging refresh, CI modernization, validation consistency, Dockerfile, community files, MATLAB diffusion fix.
- `.gitignore` ignores coverage artifacts.

## System recheck

- **165 tests passing**, 1 xfail, 0 xpass, 0 failures.
- **76% line coverage** (`pytest --cov=brainspace`).
  - Gradient/null-models/mesh: 80-99%.
  - Plotting: 55-60% (interactive Qt/VTK paths can't run in CI without a display).
- `python -m build` produces a clean sdist + wheel.
- Coverage report attached to CI via the workflow updates from #155.

## Test plan
- [x] Full suite green locally on Python 3.13.
- [x] Coverage = 76%.
- [x] Build artifacts produced cleanly (`brainspace-0.2.0.tar.gz`, `brainspace-0.2.0-py3-none-any.whl`).
- [ ] Tag `v0.2.0` after merge to trigger `tagged_release.yml` (publishes to PyPI).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `298730b33c34`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.