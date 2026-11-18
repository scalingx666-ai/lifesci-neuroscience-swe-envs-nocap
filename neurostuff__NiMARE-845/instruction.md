# Issue

**Title:** Implement caching for Estimators and Transformers

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

We are implementing caching at three levels of a meta-analysis: 

- High-level (or estimator-level): caches `_fit()`
- Mid-level (or transformer-level): caches `_transform()`
- Low-level (or modeled activation (ma)-level): caches `_get_ma_map()`

The most typical use case will be at lower levels, given that it is very common to recompute the same MA maps when working with the same database (e.g., Neurosynth). 

Transformer, at the mid-level, will benefit as well from caching.

At the estimator level, caching was implemented just for the sake of completeness. We currently recommend saving the MetaResult object to a pickle file and loading it again if will be reused. This reduces the large overhead that comes from hashing a whole NiMARE database object.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `24b15a27c6c2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.