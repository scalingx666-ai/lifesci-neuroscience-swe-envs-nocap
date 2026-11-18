# Issue

**Title:** Support liberal mask in IBMA estimators

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
Closes None. Related to 

<!-- Please give a brief overview of what has changed in the PR.
If you're not sure what to write, consider it a note to the maintainers to indicate
what they should be looking for when they review the pull request. -->
Changes proposed in this pull request:

- Add _apply_liberal_mask to separate the data in bags of voxels in the same studies. Some parts of the proposed function require nested for loops, which was inefficient, so I have adapted some of the procedures to use numba with nopython=True.
- Currently, we loop over the bags and create a Pymare dataset. In the future, we can parallelize that loop to improve performance.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a1c041403034`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.