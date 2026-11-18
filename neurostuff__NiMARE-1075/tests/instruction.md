# Issue

**Title:** [REF] improve speed of NiMARE implementation of JALE

## Description

- add restrict_to_inference_mask to ALESubtraction to reduce the number of voxels being calculated over when doing permutations (note this makes CSR more of a burden than a help)
- ContrastWorkflow accepts results and corrected results as inputs so it does not have to recompute the main effects
- add generate_description=False for both ContrastWorkflow and ResampledStability
- _threshold_z_clusters does not use nilearn for transforming
- ResampledStability now reuses the full-dataset approximate null for the subsamples, instead of recalculating the null repeatedly for each subsample
- gray-matter prior resampling is now cached

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
Closes # .

<!-- Please give a brief overview of what has changed in the PR.
If you're not sure what to write, consider it a note to the maintainers to indicate
what they should be looking for when they review the pull request. -->
Changes proposed in this pull request:

-
-

## Summary by Sourcery

Optimize JALE-related CBMA workflows and diagnostics to reduce computation and memory overhead while enabling reuse of precomputed results and nulls.

New Features:
- Allow ContrastWorkflow to accept precomputed main-effect and corrected results to avoid redundant fitting and correction.
- Add a restrict_to_inference_mask option to ALESubtraction to confine permutation inference to the directional inference mask union while keeping full-sized output maps.
- Allow ContrastWorkflow and ResampledStability to optionally skip automatic description and reference generation.

Enhancements:
- Speed up ALESubtraction and cluster-based inference by operating on boolean mask arrays instead of repeated masker inverse transforms and NiBabel round-trips, including in Monte Carlo FWE correction and z-cluster thresholding.
- Reuse a single full-dataset approximate null distribution across ResampledStability subsamples and null iterations to match JALE behavior and improve performance.
- Cache gray-matter prior resampling to the analysis mask so it can be reused across calls with the same mask and threshold.
- Use lightweight MetaResult copying for diagnostics to avoid unnecessary deep copies and large data duplication in ResampledStability.
- Avoid triggering global garbage collection when closing in-memory pairwise MA stores without temporary files.

Tests:
- Extend ALE and workflow tests to cover inference-mask restriction behavior, empty directional unions, cluster nulls under restriction, ContrastWorkflow caching and description toggling, ResampledStability description toggling, and Pairwise MA store GC behavior.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7640aa369e0d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.