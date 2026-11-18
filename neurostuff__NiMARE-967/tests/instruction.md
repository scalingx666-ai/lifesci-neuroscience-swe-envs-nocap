# Issue

**Title:** [ENH] neurosynth loading and MKDACHI2 speedup

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

<!-- Please give a brief overview of what has changed in the PR.
If you're not sure what to write, consider it a note to the maintainers to indicate
what they should be looking for when they review the pull request. -->
Changes proposed in this pull request:

- support pandas 3.0
- loading time of neurosynth dataset is greatly improved
- time with MKDA algotihms show modest improvment

## Summary by Sourcery

Improve Neurosynth dataset conversion robustness and optimize MKDA Chi-square meta-analytic computations for better performance.

Enhancements:
- Handle missing metadata fields and absent coordinates more robustly when converting Neurosynth data to NiMARE dictionaries.
- Switch sparse feature matrix loading to use dense NumPy arrays compatible with downstream processing.
- Introduce a JIT-compiled spherical convolution helper that writes into a boolean occupancy mask to speed up MKDA-based computations and reduce memory overhead.
- Optimize non-overlap handling in MKDA coordinate generation by using an occupancy mask instead of explicit coordinate deduplication.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f3799a6a261d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.