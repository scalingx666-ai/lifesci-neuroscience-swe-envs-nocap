# Issue

**Title:** [FIX] Drop a dependence group that cancels instead of failing the run

## Description

One study's uploads could end a whole image-based meta-analysis. When a group's images cancel -- their block of the estimated null correlation sums to zero -- PyMARE refuses to aggregate it and raises, naming the internal integer code and pointing the reader at "the correlation matrix supplied for this group", which the caller never supplied: NiMARE estimated it. On real staging data this fired on 3 of 16 studysets, in two shapes: an exact mirror pair (the same contrast uploaded both ways round, correlation -1), and three complementary network maps from one cohort whose pairwise correlations were unremarkable but whose 3x3 block still summed to nothing.

Screen each model before handing it to PyMARE, and exclude a group that cancels from that model rather than letting it end the run. The whole group, not one member: with three or more there is no principled choice of which to remove, and a group whose contrasts carry no joint signal has nothing to contribute either way.

Per liberal-mask bag, not per meta-analysis. A bag holds only the images valid over its voxels, so whether a group cancels is a property of the bag -- a two-image group can only cancel where both images are valid, and is a lone contrast everywhere else. Dropping globally would discard images over voxels where nothing is wrong with them.

The drop lives in _fit_over_bags, which already holds study_mask and the bag's arrays and already skips a bag left without two independent groups. Filtering study_mask alongside the data means everything derived from it -- the weights passed into PyMARE, the dof map written back -- keeps describing the fit that actually happened, which is also why this does not belong in PyMARE: PyMARE would have to return a record of what it dropped for NiMARE to re-derive both. Its guard stays as a backstop that should now never fire.

Two triggers, on two different correlations. Cancellation is judged on the estimated null correlation, because that is the matrix PyMARE aggregates the group with. A pair of images that are exact mirrors but do not cancel -- other members keep the block sum off zero -- is judged on the empirical correlation and only warned about, loudly, with the data kept: the null correlation cannot see it, since a real mirror pair sharing signal estimates near -0.94 while correlating exactly -1. Anything short of -1 that does not cancel stays silent; where to draw a line short of exact cancellation is a statistical policy only the caller can set.

Applies to Fishers as well as Stouffers, which is a judgement call worth naming: Fishers never raised here, because Brown's method rescales a cancelled block rather than dividing by it. It rescaled it as though it carried information, though, so the same exclusion is at worst neutral there and at best removes an inflated contribution -- and it keeps the verdict on a group a property of the data rather than of which combination test was chosen.

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

Exclude dependence groups whose estimated correlations cancel before combination testing so affected image-based meta-analyses continue with accurate per-bag results and diagnostics.

Bug Fixes:
- Prevent cancelling dependence groups from terminating image-based meta-analyses by excluding the affected group from each model or voxel bag before combination testing.
- Apply cancellation handling to both Stouffer and Fisher combination estimators while preserving valid data outside affected bags.

Enhancements:
- Add per-group screening based on estimated null-correlation variance and warnings for exact empirical sign-flipped image pairs that are retained.
- Track filtered groups when calculating fitted weights and degrees of freedom, and report affected studies, images, models, and voxels.

Documentation:
- Document that cancelling dependence groups are excluded locally with a warning rather than ending the meta-analysis.

Tests:
- Add coverage for per-bag cancellation, whole-group three-way cancellation, retained mirror-image warnings, near-cancellation silence, and alignment with PyMARE's cancellation threshold.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fdb11f05fa10`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.