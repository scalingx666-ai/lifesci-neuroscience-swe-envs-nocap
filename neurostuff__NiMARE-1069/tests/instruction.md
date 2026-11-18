# Issue

**Title:** [FIX] underflow (and overflow) issues

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

- clip (log)p values to be the smallest representable values
-

## Summary by Sourcery

Clamp extremely small p-values and derived statistics to the representable float32 range to avoid underflow/overflow in meta-analytic results and corrections.

Bug Fixes:
- Prevent zero or underflowed p-values from producing infinite or NaN z, t, and log(p) statistics across CBMA, CBMR, decoding, and correction workflows.
- Ensure chi-square and binomial-based p-values use survival functions and are clipped to maintain positive, finite values.

Enhancements:
- Introduce shared utilities for clipping p-values and -log10(p) values and reuse them across ALE, MKDA, CBMA base classes, and result handling.
- Normalize MetaResult map handling so p and log(p) maps are automatically clipped and stored with a consistent float32 dtype.
- Strengthen numerical stability in z-to-p, p-to-z, and z-to-t transforms by enforcing probability floors and bounded tail probabilities.

Tests:
- Add regression tests covering p-value clipping utilities, MetaResult map coercion, transforms’ behavior for extreme inputs, CBMR chi-square survival usage, and FDR correction of tiny p-values.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fe598fe44df2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.