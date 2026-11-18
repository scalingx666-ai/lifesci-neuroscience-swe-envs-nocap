# Issue

**Title:** Let MetaResult.save leave the input images out of the file

## Description

For an image-based meta-analysis, estimator.inputs_ is most of a pickled MetaResult: on twenty maps over the 2mm MNI mask it is 29.3 MB of a 36.5 MB pickle (80%), and 88% of the gzipped file, because the input maps are stored once as z_maps and again as the per-bag copies _preprocess_input derives from them. All of it is a second copy of NIfTIs that are still on disk.

It cannot come out by default, and it cannot come out via __getstate__. Loading a result and reading its inputs back is something three supported operations do: run_reports plots the input maps and their correlation matrix, PermutedOLS.correct_fwe_montecarlo refits from inputs_["beta_maps"], and the diagnostics enumerate studies from inputs_["id"]. And pickling is how NiMARE deep-copies an estimator -- both MetaResult.__init__ and MetaResult.copy go through copy.deepcopy -- so an estimator __getstate__ that dropped the inputs would break the first Corrector.transform, not just a later load.

So this is an opt-in on save, and it drops as little as it can. The keys emptied are the ones the estimator declares as images in _required_inputs plus the data_bags derived from them; the ids, sample sizes, contrast labels, correlation matrix and aggressive mask stay, since they are small and the jackknife needs the ids to enumerate the studies it refits from disk. A result saved this way still serves get_map, save_maps, save_tables, copy, Bonferroni and FDR correction, and Jackknife and FocusCounter, which re-read the images themselves. It is 17% of the full file on the pain test set and 12% at 2mm.

What it no longer serves is reporting and Monte Carlo FWE correction. Rather than let those fail with a KeyError several frames in, the dropped values are replaced by a DroppedInput placeholder that raises on any read and names the key and the flag that removed it. A coordinate-based estimator declares no image inputs, so nothing is dropped from one.

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

Allow MetaResult files to be saved without image inputs while clearly limiting operations that require those images.

New Features:
- Add an opt-in `with_inputs=False` save mode that produces smaller MetaResult files by omitting image-based estimator inputs while preserving other metadata and outputs.

Bug Fixes:
- Replace omitted inputs with explicit placeholders that provide actionable errors for reporting and Monte Carlo FWE correction instead of delayed missing-key failures.

Enhancements:
- Centralize image-input discovery across estimators, preprocessing, workflows, and result serialization.
- Preserve supported map, table, correction, copying, and diagnostic operations for results saved without input images.

Documentation:
- Document the new save option, retained capabilities, and operations unavailable when image inputs are omitted.

Tests:
- Add coverage for full and reduced save round trips, supported operations, informative failures, and unchanged coordinate-based results.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fdb11f05fa10`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.