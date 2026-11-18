# Issue

**Title:** fix: hygiene sweep slice B — BrainData modeling and prediction

## Description

Slice S-B of the 0.6.0 hygiene sweep (#535): BrainData modeling, prediction, bootstrap, plotting and the result records. Every finding was reproduced before it was fixed; each behavioural change carries the test that failed on master.

Findings fixed (ids from the #535 tracker): B-01, B-02, B-03, B-04, B-05, B-06, B-07, B-08, B-09, B-10, B-11, B-13. B-12 needed nothing here: slice H's shared ridge helper already removed the second prediction.

Behavioural:
- `similarity` intersects masks by voxel coordinate rather than by support size, and raises on grids that cannot be intersected or an empty intersection.
- `bootstrap` on a single image raises instead of resampling voxels as observations.
- Clustered thresholding keeps the requested tail: `lower=` keeps the negative tail and `upper=` no longer leaks negatives (nilearn is called with a voxel-level no-op threshold so the directional mask is the only rule).
- `standardize` no longer truncates integer or boolean input; `extract_roi` classifies an atlas by its nonzero labels; `regions(is_mask=True)` is reachable.
- `filter(runs=, sample_mask=)` attaches row metadata in the order nilearn returns the rows (its `sample_mask` normalisation reproduced, verified against fifteen configurations).
- Searchlight and ROI decoding resolve the scorer once up front, so an unknown name raises instead of producing an all-NaN map.
- `FitResult.write` percent-encodes feature-space names in filenames; the sidecar keeps the real names.
- `plot(ax=...)` reaches nilearn as `axes=` for glass and slice views; more than one map into one axes raises, and `limit=1` draws the first. `predict(plot=True)` draws the weight map it used to drop.

Mechanical: `_distance_roi` uses the shared atlas-label helper.

Migration rows: nine.

Gates: `uv run poe ok` after rebase onto 5e7e3b2f, the touched test files at `-m ''`, strict docs build.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5e7e3b2ff5ac`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.