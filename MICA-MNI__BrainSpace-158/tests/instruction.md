# Issue

**Title:** Add anterior/posterior/flat views and small colormaps

## Description

Subset of #91 — landing the cleanly-licensed parts.

## Included
- **`surface_plotting.py`** — four new view orientations: `anterior`, `posterior`, `flatL`, `flatR`. Added an inline note that `flatL`/`flatR` assume a pre-flattened mesh.
- **`colormaps.py`** — three new palettes:
  - `eco_kos` — categorical, 6-color
  - `spec_5` — 5-step Spectral from ColorBrewer 2.0 (Apache 2.0)
  - `BuGyRd` — diverging blue→grey→red, **built programmatically** by interpolating 5 control points with `np.interp`. Visually identical to the original 256-row hand-listed array, 4 lines instead of 256, far easier to review.
- **`tests/test_colormaps.py`** — registration, shape, alpha-channel, and smoothness checks.

## Skipped
`fs_colours2` (the 35-entry FreeSurfer-style palette). FreeSurfer's color LUT is under a non-BSD-compatible license; this needs explicit sourcing/clearance before it can ship in a BSD-3 package. Happy to revisit if @rcruces can confirm an independent source.

@rcruces credited as Co-author on the squashed commit.

## Test plan
- [x] `pytest brainspace/tests/test_colormaps.py` → 3 passed.
- [x] Full suite still green.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bdcf214957fc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.