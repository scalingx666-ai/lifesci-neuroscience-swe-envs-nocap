# Issue

**Title:** Remove unnecessary variance normalization steps

## Description

Closes none, but relates to 

Changes proposed in this pull request:

- Remove steps in PCA code that z-score the optimally combined data over both time and space. The data are already z-scored over time, so this has no meaningful effect.
    - I had Cursor write a short script to determine if there is an effect. I've included the code below.

```python
#!/usr/bin/env python3
"""
Verify that the "var normalize everything" step is redundant for PCA.

After z-scoring over time (per voxel), the global mean is already 0 and global
std is already 1. A second step that subtracts global mean and divides by
global std therefore leaves the data unchanged (or only rescales by a constant
if there are numerical differences). PCA results (component directions,
variance explained ratios) are identical.

Run from repo root with the project environment, e.g.:
  uv run python dev_tools/verify_pca_normalization.py
  # or: python dev_tools/verify_pca_normalization.py  (if venv is active)
"""

import numpy as np
from sklearn.decomposition import PCA
from nilearn.masking import apply_mask
from nilearn import image


def zscore_time_only(data: np.ndarray) -> np.ndarray:
    """Z-score each row (voxel) over time. Matches tedana pca.py line 213."""
    return ((data.T - data.T.mean(axis=0)) / data.T.std(axis=0)).T


def zscore_time_then_global(data: np.ndarray) -> np.ndarray:
    """Z-score over time, then subtract global mean and divide by global std."""
    data_z = zscore_time_only(data)
    data_z = (data_z - data_z.mean()) / data_z.std()
    return data_z


def main():
    np.random.seed(42)
    #n_voxels, n_time = 100, 50
    #data = np.random.randn(n_voxels, n_time) * 10 + 5  # arbitrary scale
    mask = image.math_img("(img >= 3).astype(np.uint8)", img="tedana-main/desc-adaptiveGoodSignal_mask.nii.gz")
    data = apply_mask("tedana-main/desc-optcom_bold.nii.gz", mask).T
    n_voxels, n_time = data.shape

    print("=" * 60)
    print("1. STANDARDIZATION COMPARISON")
    print("=" * 60)

    data_time_only = zscore_time_only(data)
    data_both = zscore_time_then_global(data)

    print(f"\nData shape: {data.shape} (voxels x time)")
    print("\nAfter z-score over time only:")
    print(f"  Per-row mean (should be ~0): min={data_time_only.mean(axis=1).min():.6f}, max={data_time_only.mean(axis=1).max():.6f}")
    print(f"  Per-row std (should be ~1):  min={data_time_only.std(axis=1).min():.6f}, max={data_time_only.std(axis=1).max():.6f}")
    print(f"  Global mean (should be ~0):  {data_time_only.mean():.6e}")
    print(f"  Global std (should be ~1):   {data_time_only.std():.6f}")

    print("\nAfter z-score over time + global z-score:")
    print(f"  Global mean: {data_both.mean():.6e}")
    print(f"  Global std:  {data_both.std():.6f}")

    # After time-only z-score, global mean is 0 and global std is 1
    # So the second step is (x - 0) / 1 = x => data_both should equal data_time_only
    diff = np.abs(data_both - data_time_only)
    print(f"\nMax |difference| between the two standardizations: {diff.max():.6e}")
    print(f"Are they equal (within 1e-10)? {np.allclose(data_both, data_time_only, atol=1e-10)}")

    print("\n" + "=" * 60)
    print("2. PCA RESULTS COMPARISON")
    print("=" * 60)

    n_components = min(n_voxels, n_time) - 1
    pca_time = PCA(n_components=n_components, svd_solver="full")
    pca_both = PCA(n_components=n_components, svd_solver="full")

    pca_time.fit(data_time_only)
    pca_both.fit(data_both)

    # Component time courses (right singular vectors): rows of components_
    comp_ts_time = pca_time.components_.T  # (n_time x n_components)
    comp_ts_both = pca_both.components_.T

    # Variance explained ratios should be identical (scale-invariant)
    varex_time = pca_time.explained_variance_ratio_
    varex_both = pca_both.explained_variance_ratio_

    print(f"\nVariance explained ratio (first 5 components):")
    print(f"  Time-only:  {varex_time[:5]}")
    print(f"  Both steps: {varex_both[:5]}")
    print(f"  Max |diff| in variance explained ratios: {np.abs(varex_time - varex_both).max():.6e}")
    print(f"  Ratios identical? {np.allclose(varex_time, varex_both)}")

    # Components may differ by sign (arbitrary in PCA); compare absolute correlation
    print("\nComponent time courses (direction):")
    for i in range(min(3, n_components)):
        corr = np.corrcoef(comp_ts_time[:, i], comp_ts_both[:, i])[0, 1]
        # Allow sign flip
        match = np.isclose(abs(corr), 1.0)
        print(f"  Component {i}: corr = {corr:.6f} (match: {match})")
    comp_corrs = [
        np.corrcoef(comp_ts_time[:, i], comp_ts_both[:, i])[0, 1]
        for i in range(n_components)
    ]
    print(f"  All components match (|corr| = 1)? {np.allclose(np.abs(comp_corrs), 1.0)}")

    # Voxel weights: U from SVD. Scale can differ by constant; direction should match
    # In tedana: voxel_comp_weights = np.dot(np.dot(data_z, comp_ts), np.diag(1.0 / varex))
    varex_vals_time = pca_time.explained_variance_
    varex_vals_both = pca_both.explained_variance_
    weights_time = np.dot(
        np.dot(data_time_only, comp_ts_time), np.diag(1.0 / varex_vals_time)
    )
    weights_both = np.dot(
        np.dot(data_both, comp_ts_both), np.diag(1.0 / varex_vals_both)
    )

    print("\nVoxel component weights (first component, first 5 voxels):")
    print(f"  Time-only:  {weights_time[:5, 0]}")
    print(f"  Both steps: {weights_both[:5, 0]}")
    # Weights should be proportional (same direction) since data_both == data_time_only
    # and components match; scale differs by ratio of explained_variance_
    scale_ratio = weights_time[:, 0] / (weights_both[:, 0] + 1e-20)
    print(f"  Ratio of weights (time/both) per voxel - should be constant: std={np.std(scale_ratio):.6e}")

    print("\n" + "=" * 60)
    print("3. KAPPA/RHO SCALE INVARIANCE")
    print("=" * 60)
    # Kappa/rho use weighted average: sum(w^2 * F) / sum(w^2). If we scale weights by c,
    # numerator and denominator both scale by c^2, so ratio unchanged.
    w_sq_time = weights_time[:, 0] ** 2
    w_sq_both = weights_both[:, 0] ** 2
    fake_F = np.random.rand(n_voxels)  # dummy F-statistic
    kappa_time = np.average(fake_F, weights=w_sq_time)
    kappa_both = np.average(fake_F, weights=w_sq_both)
    print(f"\nDummy weighted average (kappa-like) with scaled weights:")
    print(f"  Time-only:  {kappa_time:.6f}")
    print(f"  Both steps: {kappa_both:.6f}")
    print(f"  Identical? {np.isclose(kappa_time, kappa_both)}")

    print("\n" + "=" * 60)
    print("CONCLUSION")
    print("=" * 60)
    print(
        "The 'var normalize everything' step is redundant: it leaves the data "
        "unchanged (global mean already 0, global std already 1 after time "
        "z-score). PCA results and kappa/rho-like metrics are identical."
    )


if __name__ == "__main__":
    main()
```

Here's the output based on a local optcom file I have:

```
============================================================
1. STANDARDIZATION COMPARISON
============================================================

Data shape: (168589, 237) (voxels x time)

After z-score over time only:
  Per-row mean (should be ~0): min=-0.000025, max=0.000032
  Per-row std (should be ~1):  min=1.000000, max=1.000000
  Global mean (should be ~0):  1.250993e-08
  Global std (should be ~1):   1.000000

After z-score over time + global z-score:
  Global mean: 9.740772e-09
  Global std:  1.000000

Max |difference| between the two standardizations: 1.490116e-08
Are they equal (within 1e-10)? False

============================================================
2. PCA RESULTS COMPARISON
============================================================

Variance explained ratio (first 5 components):
  Time-only:  [0.28149262 0.10568516 0.05214774 0.03333262 0.03002319]
  Both steps: [0.28149253 0.10568522 0.05214775 0.03333261 0.03002317]
  Max |diff| in variance explained ratios: 8.940697e-08
  Ratios identical? True

Component time courses (direction):
  Component 0: corr = 1.000000 (match: True)
  Component 1: corr = 1.000000 (match: True)
  Component 2: corr = 1.000000 (match: True)
  All components match (|corr| = 1)? True

Voxel component weights (first component, first 5 voxels):
  Time-only:  [-0.23067622 -0.17136398 -0.23244272 -0.22848272 -0.0395031 ]
  Both steps: [-0.23067634 -0.17136405 -0.23244283 -0.22848284 -0.03950311]
  Ratio of weights (time/both) per voxel - should be constant: std=1.824646e-05

============================================================
3. KAPPA/RHO SCALE INVARIANCE
============================================================

Dummy weighted average (kappa-like) with scaled weights:
  Time-only:  0.500531
  Both steps: 0.500531
  Identical? True

============================================================
CONCLUSION
============================================================
The 'var normalize everything' step is redundant: it leaves the data unchanged (global mean already 0, global std already 1 after time z-score). PCA results and kappa/rho-like metrics are identical.
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7a5d9e4e957d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.