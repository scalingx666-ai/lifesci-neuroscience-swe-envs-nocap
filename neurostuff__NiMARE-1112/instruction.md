# Issue

**Title:** Refuse an image-based meta-analysis of fewer than two analyses

## Description

Every IBMA estimator needs at least two independent units, so a fit over a single analysis returns maps that are NaN at every voxel. Nothing said so. `StudysetView.resolve` guards zero rows -- "The collection has no data for 'z_maps'" -- but nothing guarded one, and the two masking strategies both produce the NaN quietly: `aggressive_mask=True` fits one model that `DependenceModel.supports_inference` rejects, and `aggressive_mask=False` has `_liberal_mask_bags` drop every bag for holding fewer than two studies, which leaves no skipped model for `_fit_over_bags` to warn about. The caller gets a MetaResult, writes it out, and finds out later.

This came out of a Neurostore studyset of 12 analyses that lost 11 of them to missing required map types. The one that survived fit, and the answer the caller needed was "your studyset lost 11 of 12 analyses", not "the maps are NaN" -- so the message carries both counts, and names the required inputs when analyses were dropped for want of them.

The floor is on the IBMA path only. A single-experiment CBMA produces a real map rather than NaN -- ALE, MKDADensity and KDA all return finite z over one study's foci -- so there is no evidence for the same floor in `Estimator._collect_inputs`, and it would be a stricter change.

Checked before raising, so no image is loaded first: too few analyses is a property of the collection, not of what the files contain.

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

Require sufficient independent analyses for IBMA fitting and resampling operations to fail early instead of producing invalid results.

New Features:
- Reject image-based meta-analyses that have fewer than two usable analyses, with errors identifying dropped analyses and missing required inputs.
- Expose minimum-analysis requirements to diagnostics so jackknife and resampling workflows reject insufficient replicates.

Bug Fixes:
- Prevent IBMA fits with a single analysis from silently returning all-NaN maps.

Enhancements:
- Keep CBMA estimators exempt from the minimum-analysis check while enforcing estimator-specific floors for IBMA diagnostics.

Documentation:
- Document the new minimum-analysis behavior for IBMA fitting, jackknife, and resampled stability diagnostics.

Tests:
- Add coverage for insufficient IBMA fits, dropped required inputs, valid two-analysis fits, jackknife requirements, resampling floors, and unaffected CBMA jackknives.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `18fb103cad82`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.