# Issue

**Title:** Fix assignment map value

## Description

**Title:** fix: report the maximum map value within the overlap

### Summary
- For image inputs on statistical maps, report as "map value" the maximum of the regional map within its overlap with the input, in both `Map` and `SparseMap`.
- Describe the current assignment results in the anatomical assignment examples.

### Changes
- `siibra/volumes/parcellationmap.py`:
  - `Map._assign_volume`: for statistical maps, the map value is the maximum of the (thresholded) regional map over the voxels it shares with the input component. Previously it was None. Labelled maps keep the region's label.
  - `Map.assign`: document the new map value, including for uncertain coordinates assigned as Gaussian kernel images.
- `siibra/volumes/sparsemap.py`, `SparseMap._assign_volume`: same map value. Previously it was the maximum of the whole regional map, identical for every input component.
- `examples/05_anatomical_assignment/001_coordinates.py`:
  - List the columns for an exact coordinate and the scores for an uncertain one, with their definitions.
  - State when a Gaussian kernel is used.
  - Replace the former column names ("contained", "contains") and the claim of a default sort by correlation.
- `examples/05_anatomical_assignment/002_activation_maps.py`: describe how an image is split into components, the columns per component, the row order and `split_components`; refer to 001 for the scores.

### Tests
- `test/volumes/test_parcellationmap.py`:
  - `TestMapAssignScoreColumns::test_map_value_is_the_maximum_within_the_overlap` (`Map` and `SparseMap`): an input overlapping only the 0.2 part of a regional map gets 0.2; one covering the 0.8 part gets 0.8.
  - `TestMapAssignVolume::test_map_value_of_labelled_maps_is_the_label`.

### Notes
- [x] requires #747
- Changed outputs: "map value" for image inputs and uncertain coordinates can only stay the same or decrease. This is visible in `002_activation_maps.py`, `2025-paper-fig3.py` and the uncertain point in `001_coordinates.py`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `195041b16581`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.