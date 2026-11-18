# Issue

**Title:** Fix labelledmap volume assignment

## Description

**Title:** fix: correct volume assignment for labelled maps

### Summary
- Fix `lower_threshold` in `Map` (labelled maps) volume assignment: threshold the map values instead of filtering results by intersection over union, and reject non-zero values for labelled maps.
- Fix swapped score columns and other incorrect results of `Map` (non-sparse) volume assignment.

### Changes
- `siibra/volumes/parcellationmap.py`:
  - `Map._assign`: raise `ValueError` for a non-zero `lower_threshold` on labelled maps, for point and volume inputs.
  - `Map._assign_volume`:
    - Set map values below `lower_threshold` to zero (statistical maps, not in place); skip pairs without overlap instead of filtering on intersection over union.
    - Pass the regional map as first array to `compare_arrays`. Previously "map/input containedness" and "map/input weighted mean" were swapped.
    - Enter the `QUIET` context, which `with QUIET and ...` never entered.
    - Accept `minsize_voxel` and skip input components with at most that many voxels (the default of 1 skips single-voxel components).
    - Report component centroids in physical coordinates instead of voxel coordinates. 
    - Set correlation to `None` for labelled maps, so the "correlation" column is dropped.
  - `AssignImageResult`: document the convention first = regional map, second = input.
  - `Map.assign`: document `lower_threshold`, `minsize_voxel` and `split_components`; rewrite `Returns` for the current columns.
  - `Map._assign`, `Map.assign`, `Map._assign_points`, `Map._assign_volume`: type hints and numpy-style docstrings.
- `e2e/volumes/test_parcellationmap.py`: `test_point_assignment_to_labelled` asserts the region of the uncertain point (the check had no `assert`), selecting the first row by position.

### Tests
- `TestMapAssignLowerThreshold`:
  - the threshold acts on map values, not on the score;
  - no row when no map value survives the threshold;
  - regions without overlap are excluded;
  - the map array is not modified;
  - labelled maps reject non-zero thresholds for `Point`, `PointCloud` and `Volume` inputs, and accept the default.
- `TestMapAssignScoreColumns`: the same asymmetric case through `Map` and `SparseMap` fills every score column with the same values.
- `TestMapAssignVolume`:
  - `minsize_voxel` skips components with at most that many voxels
  - centroids are in physical coordinates;
  - correlation is reported for statistical maps only.

### Related issues
- #717

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `195041b16581`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.