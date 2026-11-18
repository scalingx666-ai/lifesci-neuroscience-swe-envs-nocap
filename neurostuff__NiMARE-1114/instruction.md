# Issue

**Title:** Drop an input image that has no usable voxel

## Description

An entirely zero upload -- 2 of 242 maps in one real Neurostore staging studyset -- reached the estimator with no warning of any kind, and did harm either way the mask was built. With aggressive_mask=True it emptied the intersection over every image by itself, so every output map came back NaN and the only signal was a voxel count that never named the map responsible. With aggressive_mask=False it joined no liberal-mask bag, so it changed no number in the result, but it still held a row in inputs_["id"] and a slot in contrast_names: anything reporting what the meta-analysis rested on counted an analysis that contributed nothing anywhere.

_preprocess_input already computed the array the check needs, since `validity` is exactly where each image has a usable value in every required input; it simply never asked whether a whole image was empty. Ask it, and drop the image the way any other unusable input is dropped, naming it in the warning. Under drop_invalid=False, raise instead -- that flag already means "do not silently narrow my inputs" -- and raise as well when the drop would leave nothing to meta-analyse.

The check has to live here rather than at input collection: emptiness is a property of the voxels, which collection deliberately never reads, so moving it there would mean loading, resampling and masking every image inside the studyset layer and then doing it again in the estimator.

Dropping here means several parallel structures must stay aligned, so rather than filtering each in turn the drop narrows studyset_ and re-collects from it, which realigns inputs_["id"], the metadata inputs and blocks_ by construction; only the already-masked image arrays are carried across, so nothing is read off disk twice. Studyset gains select_analyses for the positional narrowing that needs. groupby labels given as a sequence are the one input the re-collection cannot reach -- they are positional, not part of the studyset -- so the drop records which images survived and _resolve_group_labels narrows them to match, instead of failing its own length check.

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

Prevent images with no usable voxels from contributing to meta-analyses while preserving input alignment and clear failure behavior.

Bug Fixes:
- Drop input images with no usable voxels before meta-analysis and identify them in warnings.
- Raise an error when invalid-image dropping is disabled or when removing unusable images leaves no analyses to process.
- Keep image IDs, metadata, contrasts, studysets, and positional group labels aligned after invalid images are removed.

Enhancements:
- Add positional analysis selection support to Studyset for consistent narrowing of collected analyses.

Documentation:
- Document that unusable images, including all-zero images, are ignored by default and that disabling invalid-input dropping raises an error.

Tests:
- Add coverage for unusable images under aggressive and liberal masking, refusal cases, and positional group-label alignment.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fdb11f05fa10`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.