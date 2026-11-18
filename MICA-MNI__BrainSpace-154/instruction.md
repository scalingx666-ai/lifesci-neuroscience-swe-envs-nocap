# Issue

**Title:** Refresh packaging metadata; drop unused pandas/pillow

## Description

.

## Summary
- `python_requires` bumped from `>=3.5` to `>=3.9`; classifiers list 3.9-3.13 to match the CI matrix.
- Development Status classifier: `3 - Alpha` -> `4 - Beta`.
- **Dropped `pandas` and `pillow`** from `INSTALL_REQUIRES`. Neither is imported anywhere under `brainspace/`; both were tutorial-only deps inflating the install footprint.
- Moved `nilearn` from base requirements to `extras_require['examples']` — it's only used by tutorial notebooks.
- Bumped dep floors to versions that actually work on supported Pythons: `numpy>=1.20`, `scipy>=1.6`, `matplotlib>=3.3`, `nibabel>=3.2`. The old `numpy>=1.11` / `scipy>=0.17` floors haven't been buildable on supported Pythons for years.
- Widened the VTK upper bound from `<9.6` to `<9.7` so users can install the most recent VTK release.
- `requirements.txt` now mirrors `install_requires` exactly, so CI and end-user installs produce the same environment.
- Fixed `description-file` -> `description_file` in `setup.cfg` (setuptools deprecation warning on every build).
- Updated [`docs/pages/install.rst`](docs/pages/install.rst) to reflect the supported Python range and the move of `nilearn` to an extra.

## Test plan
- [x] `python setup.py --version` succeeds without setuptools deprecation warnings.
- [x] Full test suite still passes (132 passed locally).
- [ ] CI matrix run on this PR once 3.12/3.13 are added ().

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d1c514a9a466`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.