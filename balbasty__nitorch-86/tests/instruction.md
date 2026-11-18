# Issue

**Title:** anatomix registration features

## Description

## Summary

Adds [anatomix](https://www.neeldey.com/anatomix/) (Dey et al.) as an opt-in feature-space transform for the pairwise registration pipeline, so images from different modalities/contrasts can be registered by comparing extracted, modality-agnostic features instead of raw intensities.

## Design

Mirrors the existing `mind=` parameter on `make_image()` rather than adding
a new loss type:

- `anatomix=None|str|True|dict` on `make_image()`, mirroring `mind=`'s own
  `True`/explicit-value shorthand
- Per pyramid level: `level.preview` keeps the original intensities,
  `level.dat` is replaced by the extracted 16-channel anatomix feature map
- **No new loss class and no change to `make_loss()`** — whichever existing
  loss you already select (`'lcc'`, `'cc'`, `'mse'`, ...) runs unchanged on
  the feature-valued data
- `--anatomix [PATH]` CLI flag, mirroring `--mind [FWHM=1 [RADIUS=0]]`

This keeps the change additive and avoids duplicating nitorch's own
optimizer stack — anatomix's own reference implementation bundles a
separate ConvexAdam-based instance-optimization pipeline that is **not**
adopted here; only its feature-extraction model is.

## What's included

- `nitorch/_models/anatomix/` — a minimal, dependency-light vendored 3D
  U-Net + weight loader (no new hard dependency; verified
  parameter-for-parameter against the real published checkpoint, ~5.9M
  params)
  - Weights default to a user-supplied local path (no implicit network
    access — safe for offline/HPC environments); automatic download from
    the official HuggingFace Hub distribution (`neeldey/anatomix`) is an
    explicit opt-in
- `make_image(..., anatomix=...)` wiring in `pairwise_makeobj.py`
- `--anatomix` CLI flag in the `register` subcommand
- 13 new tests (`nitorch/tests/test_anatomix_extraction.py`,
  `test_anatomix_image.py`)

## Notes / known limitations

- The vendored U-Net's state-dict layout was reverse-engineered from the
  real checkpoint (flat `nn.Sequential`-style keys) and is remapped onto
  this package's named-module structure in `weights.py`; verified to load
  the actual `anatomix.pth` and produce sane, non-degenerate output.
- A synthetic-data test validates the *mechanism* (both intensity-based and
  anatomix-based registration run to completion and can be scored with an
  existing nitorch metric), but does **not** assert anatomix outperforms
  intensity-based registration on that fixture — that specific claim needs
  a realistic multimodal dataset to validate meaningfully (see the test's
  docstring for the reasoning).

## Test plan

- [x] 13 new tests, all passing
- [x] Full existing test suite passes with zero regressions (1723 tests)
- [x] Manually verified against the real downloaded `anatomix.pth`
      checkpoint (state-dict loads, ~5.9M params, sane feature output)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a355cc7e2eae`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.