# Issue

**Title:** skip and log features that do not exist in both groups

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
 

<!-- Please give a brief overview of what has changed in the PR.
If you're not sure what to write, consider it a note to the maintainers to indicate
what they should be looking for when they review the pull request. -->
Changes proposed in this pull request:

- skip correlationDecoder on features that only exist in one group
- log those features at the INFO level.

## Summary by Sourcery

Skip undecodeable features in continuous correlation decoders and log them instead of failing when comparison groups are missing.

Bug Fixes:
- Prevent CorrelationDecoder from attempting to decode features that lack both selected and unselected study groups, avoiding invalid pairwise meta-analyses.

Enhancements:
- Introduce preprocessing to filter out features without valid comparison sets and log skipped features at INFO level in pairwise decoders.
- Refactor parallel decoding map collection into a helper that ignores missing feature results.

Tests:
- Add a test ensuring pairwise CorrelationDecoder skips features without a valid comparison set and logs the skipped features.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5fac65c0eb59`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.