# Issue

**Title:** Remove `resample` argument from IBMA estimators

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
Related to #817.

Currently if `resample=False` we get an error if at least one image has shape/affines different from the mask. In this case, users will have to run an IBMA again with `resample=True` even if most images don't need to be resampled.

<!-- Please give a brief overview of what has changed in the PR.
If you're not sure what to write, consider it a note to the maintainers to indicate
what they should be looking for when they review the pull request. -->
Changes proposed in this pull request:

- In this PR we remove that burden from users and perform the resampling only if the shape/affines are different. 
- Also, we are removing the `memory_limit` argument, given that `use_memmap` decorator is not being used by IBMA estimators.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e833c4bcb4a9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.