# Issue

**Title:** [ENH] Forward PyMARE's small_sample_correction

## Description

PyMARE 0.0.11rc2 corrects its model-based standard errors for a small number of studies, defaulting to the Knapp-Hartung adjustment. The Wald reference treats an estimated tau^2 as if it were known, which is anti-conservative once few studies are pooled.

Passed through as None, so each PyMARE estimator keeps its own default rather than a single NiMARE-imposed value. Those differ, and the difference is deliberate: the estimators that estimate tau^2 correct by default, while WeightedLeastSquares does not, since its tau^2 is supplied.

The parameter is inert once group labels are present, where CR2 standard errors and Satterthwaite degrees of freedom are the correction instead.

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

Forward PyMARE small-sample correction settings through IBMA regression estimators without overriding their native defaults.

New Features:
- Expose PyMARE small-sample correction choices for IBMA regression estimators while preserving estimator-specific defaults when unspecified.

Enhancements:
- Document the correction behavior for model-based and grouped analyses, including Knapp–Hartung and Wald references.
- Validate correction values and add coverage for forwarding, default preservation, model-based inference changes, and grouped-analysis behavior.

Build:
- Raise the minimum PyMARE dependency to 0.0.11rc2 to support small-sample corrections.

Documentation:
- Add the Knapp and Hartung reference to the bibliography.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cf1ec671ba4f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.