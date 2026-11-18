# Issue

**Title:** Fix align sparsemap assignment

## Description

**Title:** fix: align SparseMap and Map volume assignment

### Summary
- Make `Map` and `SparseMap` produce the same assignment results for the same input: threshold rule, query space check, component numbering, row order, `minsize_voxel` and correlation.
- Fix bounding boxes in `SparseMap` volume assignment: the correlation domain extended one voxel past the input component, and components overlapping a regional map only in its upper corner voxel were not assigned.
- Deprecate unknown keyword arguments of `Map.assign`.

### Changes
- `siibra/volumes/parcellationmap.py`:
  - `_pearson_correlation` (new): correlation shared by `Map` and `SparseMap`; NaN without a `RuntimeWarning` when either array is constant.
  - `Map.assign`:
    - `split_components` is an explicit keyword-only parameter. Other keyword arguments are ignored with a `FutureWarning`; from `1.0.1-alpha.28` on they raise `TypeError`.
    - Docstring documents the `lower_threshold` rule (values at or below are excluded), the row order, the numbering of "input structure" and the correlation definition.
  - `Map._assign_points`: results of the multi-point readout are sorted by point (stable).
  - `Map._assign_volume`:
    - Map values at or below `lower_threshold` are set to zero (previously only values below).
    - An unsplit input is labelled component 1 (previously 0).
    - Results are sorted by input component (stable).
    - The correlation of statistical maps is the Pearson coefficient over the bounding box of the unthresholded regional map and the component, replacing the value from `compare_arrays`.
- `siibra/volumes/sparsemap.py`, `SparseMap._assign_volume`:
  - Raise `ValueError` for a query volume in another space, before fetching it.
  - Map values at or below `lower_threshold` are set to zero (previously only values below).
  - Overlap pre-check and correlation domain use the exact inclusive voxel bounding boxes instead of `BoundingBox.intersection`/`union`.
  - Correlation via `_pearson_correlation`.
  - Remove the unused `self.space.get_template()` call.
  - Docstring: `minsize_voxel` (components with at most that many voxels are skipped), `lower_threshold`, `time`, `Returns`, `Raises`; `time` typed as `Optional[int]`.

### Tests
- `test/volumes/test_parcellationmap.py`, `TestMapAssignScoreColumns`. Each case runs through both `Map` and `SparseMap`; the fixture now builds maps with any number of regional maps.
  - `test_only_map_values_above_threshold_count`: values equal to the threshold are excluded.
  - `test_rejects_query_in_other_space`: `ValueError`, and the query is not fetched.
  - `test_components_are_numbered_from_1`: with and without splitting.
  - `test_rows_are_ordered_by_component_then_map`: two components × two regional maps.
  - `test_point_rows_are_ordered_by_point_then_map`: two points × two regional maps.
  - `test_minsize_voxel_skips_components_of_at_most_that_size`: a single-voxel component is kept with 0 and skipped with 1.
  - `test_correlation_over_bounding_box_of_both`: matches `np.corrcoef` over the expected domain, with and without a threshold.
  - `test_undefined_correlation_is_nan_without_warning`.
  - `test_component_touching_a_map_in_its_corner_voxel`: a single voxel and a 27-voxel block.
  - `test_unknown_keyword_arguments_are_ignored_with_a_warning`.

### Related issues
- #717

### Notes
- [x] #744
- Deprecation: unknown keyword arguments of `Map.assign` (removal at `1.0.1-alpha.28`).
- Changed outputs: `SparseMap` correlation values (exact domain), additional `SparseMap` rows for components touching a regional map at its upper corner voxel, and the changed row order and component numbering for `Map`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `195041b16581`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.