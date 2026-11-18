# Issue

**Title:** [FIX] Read weights back by the transpose in coefficient_image; add per-voxel atlas weights and Haufe patterns

## Description

`coefficient_image` read a fitted pipeline's weights back to voxels by calling each step's `inverse_transform`. That inverse maps a *point* back to the input space, `A⁻¹(z − c)`. A *weight* transforms the other way. A model that scores `w @ (A x + c)` scores `(Aᵀw) @ x` plus a constant, so the weight on the inputs is `Aᵀw`, and the offset `c` belongs to the intercept. The two agree only for an orthogonal step with no offset.

So any scaler or PCA in the pipeline gave a wrong map without raising an error. Through a `StandardScaler` the image was `w·σ + μ`, where the voxel weight is `w/σ`: off by σ² per feature, plus the feature means. In a three-feature check (σ ≈ 1, 10, 0.1), `w/σ` is `[315.8, 32.0, 34.0]` and `coefficient_image` returned `[307.8, 2938.3, 5.35]`. `TruncatedSVD` and feature selectors happened to be correct, because their inverse is their transpose.

This PR fixes that, then adds two features that follow from it: per-voxel weights through atlases, and activation patterns.

## 1. Weights move back by the transpose ([FIX], first commit)

- `_undo` no longer falls back to `inverse_transform`. `_pull_back` applies the transpose of each step's known linear part, without its offset:
  - `StandardScaler`, `MaxAbsScaler`, `RobustScaler` → `w / scale_` (`w` unchanged when `scale_` is `None`)
  - `MinMaxScaler` → `w * scale_`
  - `PCA` → `w @ components_`, first divided by `sqrt(explained_variance_)` when `whiten=True`
  - `TruncatedSVD` → `w @ components_` (unchanged in effect)
  - feature selectors (`SelectorMixin`) → zero-filling `inverse_transform`, which *is* the transpose of a selection (unchanged in effect)
- Any other step raises a `ValueError` naming the step and the supported ones, instead of returning a plausible-looking wrong map.

## 2. `atlas="voxel" | "region"`: weights through a `MaskerTransformer`

Previously each region's weight was painted on every voxel of the region. Those values don't score a map the way the model does, and they bias the eye toward large parcels. The same transpose rule now applies:

| Reducer | Voxel weight |
|---|---|
| labels atlas, `strategy="mean"` | `w_r / n_r` |
| labels atlas, `strategy="sum"` | `w_r` |
| maps atlas (least-squares fit, `A = (M Mᵀ)⁻¹ M`) | `Mᵀ (M Mᵀ)⁻¹ w` |
| `NiftiMasker` that only smooths | its own transform (a Gaussian is symmetric) |

Each reading is the masker's own `inverse_transform` of adjusted weights, and the region matrix comes from `inverse_transform(eye(K))`. So the matrix is the one the masker itself uses, without relying on nilearn internals. Strategies that aren't linear in the voxels (`maximum`, `median`, …) and `NiftiMasker` signal cleaning (`standardize`, `detrend`, filtering) are refused. `atlas="region"` keeps the painted display.

## 3. `kind="weights" | "pattern"`: Haufe activation patterns

Weights say what a model uses, including voxels that only cancel noise elsewhere, so a weight map isn't an activation map (Haufe et al., 2014). `kind="pattern"` returns `cov(voxels, scores) @ pinv(cov(scores))`. The voxels are the data at the voxel stage: after the `MAKernel`, followed into a `ColumnTransformer` branch, or `X` itself. The scores are the model's final features times its weights.

It walks no steps backwards, so it works through **any** pipeline whose final model is linear in its features, including steps whose weights can't be read back (e.g. `QuantileTransformer`). A new `X=` argument supplies the rows when the pipeline wasn't fitted on `bunch.data`. Models without `coef_` are refused for patterns.

## Tests

All new tests check a defining property, not the implementation:
- **Weights** (`test_coefficient_image_weights_reproduce_the_model`, `…_reads_an_atlas_back_per_voxel`): `pipeline.predict(X) − MA(X) @ voxel_weights` is constant across rows. Cases: every supported step, a nested `StandardScaler → PCA`, labels-mean and labels-sum atlases with deliberately unequal region sizes, overlapping probabilistic maps, and smoothing and plain `NiftiMasker`. ALE maps are used because on binary MKDA maps most scalers' scales are 1 and the old code passes by accident.
- **Patterns** (`…_pattern_is_the_haufe_pattern`, `…_pattern_reads_through_a_column_transformer`): the image equals `cov(MA maps, pipeline.predict) @ pinv(cov(predict))`, for one and two outputs, through scaler+PCA, through `QuantileTransformer`, and through a `ColumnTransformer` with descriptors.
- **Refusals:** unknown steps, non-linear atlas strategies, row-dependent cleaning, an invalid `kind`/`atlas`, and a pattern of a model with no readout.
- **Regression check:** against `main`'s `interpret.py`, the weight property tests fail in 11 cases and pass only in the 4 that were already correct (TruncatedSVD, VarianceThreshold, sum-strategy labels, plain voxel masker).

The first CI run failed `PCA` and `TruncatedSVD` on several platforms. That was a test flaw: the predictions are float32 values near 4.0 with a spread of about 0.02, so float32 rounding (~5e-7) exceeded the `1e-5 × spread` tolerance. The shared helper now adds a float32 rounding allowance based on the size of the values. The fits use a centred target, so a large intercept can't push that allowance up and hide PCA's `mean_` offset.

Locally, `pytest nimare/tests/test_ml.py` gives 182 passed. One error, `test_exact_field_names_win_over_pattern_matching`, also occurs on `main` here because `pyarrow` isn't installed. Black, isort and flake8 are clean.

## Behaviour changes

- A step outside the supported list now raises in `kind="weights"`, where it used to return a map. Happy to soften this to a warning if preferred.
- **Atlas pipelines return different maps by default.** `atlas="voxel"` divides by region size (labels) or corrects for map overlap. Pass `atlas="region"` for the old painted output.

Docs: the docstring gains Notes on the derivation, `docs/machine_learning.rst` documents `atlas=` and `kind=` and no longer says a step is undone "through whatever declares an inverse", and Haufe et al. (2014) is added to `references.bib`.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Summary by Sourcery

Correct coefficient-image weight projection and add per-voxel atlas readings and Haufe activation-pattern maps.

New Features:
- Add Haufe activation-pattern images for linear model readouts, including pipelines with arbitrary feature transformations and optional input data.
- Support per-voxel atlas weight maps alongside the existing region-painted representation.

Bug Fixes:
- Correct coefficient-image projection through preprocessing and dimensionality-reduction steps by applying transposed linear mappings rather than point inverse transforms.
- Reject unsupported nonlinear transformations, atlas strategies, and row-dependent masker cleaning instead of producing invalid weight maps.

Enhancements:
- Extend coefficient-image interpretation across supported scalers, PCA/SVD, feature selectors, masker transformations, smoothing, and nested pipeline structures.
- Document weight-map derivation, atlas readings, activation patterns, and the Haufe reference.

Documentation:
- Document the new atlas and pattern options and update coefficient-image behavior and interpretation guidance.

Tests:
- Add property-based coverage verifying reconstructed model scores for supported preprocessing and atlas configurations.
- Add coverage for Haufe patterns, nested and column-transformer pipelines, unsupported configurations, and numerical edge cases.

Chores:
- Add the Haufe et al. (2014) citation to the project references.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `171d769a2de5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.