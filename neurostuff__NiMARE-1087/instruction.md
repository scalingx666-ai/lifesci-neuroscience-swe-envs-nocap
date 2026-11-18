# Issue

**Title:** [FIX] table generation with cluster corrected images in Jackknife and focuscounter

## Description

<!---
This is a suggested pull request template for NiMARE.
It's designed to capture information we've found to be useful in reviewing pull requests.

If there is other information that would be helpful to include, please don't hesitate to add it!

Please also label your pull request with the relevant tags.
See here for more information and a list of available options:
https://github.com/neurostuff/NiMARE/blob/main/CONTRIBUTING.md#pull-requests
-->

<!-- Please indicate after the # which issue you're closing with this PR.
This is helpful for the maintainers AND will magically close the issue when this
pull request is merged!
https://help.github.com/articles/closing-issues-using-keywords -->
  .

<!-- Please give a brief overview of what has changed in the PR.
If you're not sure what to write, consider it a note to the maintainers to indicate
what they should be looking for when they review the pull request. -->
Changes proposed in this pull request:

- replace voxel_thresh with target_thresh (since applying a voxel_thresh to a cluster corrected image is technically correct, but it is semantically confusing)
- resolve to the correct z map from the corresponding corrected image.

## Summary by Sourcery

Introduce a new diagnostics threshold API and corrected-cluster handling, while scaffolding the future `nimare.ml` masked activation feature dataset module with tests, specs, and examples.

Bug Fixes:
- Ensure diagnostics cluster tables for Monte Carlo cluster-corrected maps use thresholded cluster support combined with the original statistic/z maps for peak values.
- Prevent ambiguous or incorrect use of voxel-level thresholds in diagnostics by resolving cluster-corrected targets to the appropriate statistic maps.

Enhancements:
- Add a `target_threshold` parameter to diagnostics, deprecating `voxel_thresh` with explicit alias handling and validation.
- Improve diagnostics cluster table generation to detect cluster-corrected target images and automatically select the corresponding original statistic map for peak reporting.
- Add helper utilities in diagnostics for cluster label support and peak map resolution to standardize table/support generation.

Documentation:
- Add a comprehensive specification, data model, quickstart, contracts, tasks, and checklist documentation for the upcoming masked activation feature dataset (`nimare.ml`) module, including public API and scikit-learn compatibility contracts.
- Add Sphinx-Gallery example scaffolds for masked activation feature dataset creation and reduction workflows under `examples/05_machine_learning`.
- Document the new diagnostics `target_threshold` parameter and clarify its relationship to deprecated `voxel_thresh` for cluster-corrected images.

Tests:
- Add tests covering deprecation behavior and alias resolution between `voxel_thresh` and `target_threshold` in diagnostics.
- Add tests verifying corrected-cluster diagnostics tables use original z statistics within thresholded cluster support for peak values.
- Update Jackknife and FocusCounter diagnostics tests to use `target_threshold` instead of `voxel_thresh` and validate tail label map naming, mixed-sign cluster warnings, and group-specific behavior.
- Add initial tests for the new `nimare.ml` module, including a canonical Studyset fixture and placeholders asserting that unimplemented ML components currently raise `NotImplementedError`.

Chores:
- Create scaffolding for the new `nimare.ml` module, exposing `MAFeatureDataset`, `MAFeatureExtractor`, and `make_map_reducer` as placeholders.
- Add planning and checklist artifacts for the masked activation feature dataset feature under `specs/001-ma-feature-dataset/`, capturing research, implementation plan, tasks, and requirements.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ba8d9214e263`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.