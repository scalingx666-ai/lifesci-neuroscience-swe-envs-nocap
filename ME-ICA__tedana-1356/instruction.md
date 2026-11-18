# Issue

**Title:** Reuse saved ICA component maps when generating component figures

## Description

Closes none.

<!-- Please give a brief overview of what has changed in the PR.
If you're not sure what to write, consider it a note to the maintainers to indicate
what they should be looking for when they review the pull request. -->
Changes proposed in this pull request:

- Reuse saved ICA component maps when generating component figures instead of recalculating weights.
- Load the 4D component NIfTI once and iterate over components linearly.
- Refactor single-component figure generation into a dedicated helper.
- Preserve non-orthogonalized mixing matrices for standard component maps, reports, and external-regressor correlations when TEDORT is enabled.
- Save orthogonalized component maps separately as desc-ICAOrth_components.nii.gz in verbose TEDORT runs.
- Apply consistent component-map handling in tedana and ica_reclassify.
- Correct mixing-matrix shapes and stale parameters in writeresults documentation.
- Add regression tests for component-map selection and single-load figure generation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `790375b44e20`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.