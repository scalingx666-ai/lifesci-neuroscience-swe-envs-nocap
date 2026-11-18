# Issue

**Title:** [ENH] make ALE/FWE faster

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
Closes # .
I want ALE to be more accessible to run on the cloud since most people coming from GingerALE will want to use ALE due to familiarity. And then they run these massive (1000+ study) meta-analyses with FWE correction.

<!-- Please give a brief overview of what has changed in the PR.
If you're not sure what to write, consider it a note to the maintainers to indicate
what they should be looking for when they review the pull request. -->
Changes proposed in this pull request:

- jit the approximate-null histogram update
- change monte carlo/FWE permutation to pass around precomputed ijk voxel indices instead of doing xyz->ijk each iteration

## Summary by Sourcery

Speed up ALE/FWE null distribution estimation and permutation-based correction while supporting reuse of precomputed voxel indices.

Enhancements:
- JIT-compile ALE approximate-null histogram construction and update steps to avoid repeated dense allocations during histogram combination.
- Allow kernel transformers to consume DataFrames with precomputed matrix indices (i, j, k) and avoid redundant mm-to-voxel conversions when those are present.
- Refactor Monte Carlo and FWE permutation routines to sample and pass voxel index coordinates (i, j, k) directly instead of converting to and from world (x, y, z) space each iteration.

Tests:
- Add tests verifying that kernel transforms using precomputed (i, j, k) indices produce identical results to transforms using (x, y, z) coordinates.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `20020318ee04`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.