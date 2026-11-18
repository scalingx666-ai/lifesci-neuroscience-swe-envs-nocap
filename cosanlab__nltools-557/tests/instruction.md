# Issue

**Title:** fix(mask): round atlas labels to integers instead of truncating them

## Description

## Problem

Float atlases store integer labels with noise. `masks/k50_2mm.nii.gz` has, for example, `6.99999994` for label 7. Four places convert labels with `astype(int)` / `int()`, which **truncates**, so a noisy label *k* becomes *k−1* and that parcel silently merges into its neighbour. `expand_mask` already rounds (`np.round`, `mask.py:140`), so the two paths disagree.

| where | effect |
|---|---|
| `_resolve_atlas_label_vec` (`analysis.py`), used by `distance` / `predict` / `align` with `spatial_scale='roi'` | k50 yields **46** parcels instead of 50. Per-ROI results then have fewer rows than `expand_mask(atlas)`, and `roi_to_brain` raises *"Data must have the same number of rows as mask has ROIs"*. |
| `roi_to_brain_from_atlas` (`mask.py`) | a `0.9999999` voxel is painted as background (`fill`); a `1.9999999` voxel gets label 1's value |
| `_label_deterministic` (`labeling.py`), behind `label_coords` | voxels named after the wrong region (or `no_label`) |
| `_cluster_label_string` (`reporting.py`), behind cluster reports | same, in the region-share strings |

Found through the DartBrains course: the RSA chapter's per-ROI one-liner raised the `roi_to_brain` error, and Spatial_Feature_Selection reported "46 parcels" from the 50-parcel k50 atlas (four pairs of neighbouring parcels merged).

## Fix

All four sites apply `np.rint` before converting to integers.

## Tests

Four regression tests, one per path, each on a synthetic atlas with float-noise labels (`0.9999999`, `1.9999999`, `2.9999999`):

- **With the fix:** 4 pass.
- **Against the original code:** all 4 fail with the reported symptoms (`2 == 3` RDMs, a label-1 voxel painted as background, `['no_label', 'A', 'B']` instead of `['A', 'B', 'B']`).
- `pytest nltools/tests/core/test_mask.py nltools/tests/data/atlases nltools/tests/data/braindata`: **479 passed**, 1 skipped.
- `ruff check` / `ruff format --check` clean on the touched files.
- **Real data:** k50 through `_resolve_atlas_label_vec` gives **50** labels (truncation gave 46), and `distance(spatial_scale='roi')` returns 50 RDMs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cf366c2ba365`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.