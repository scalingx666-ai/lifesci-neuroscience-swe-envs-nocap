# Issue

**Title:** Add metrics for common measures of explained variance

## Description

.

For example, if we have two components that each explain 20% of the optimally combined data's variance, but also share 50% of their variance (and thus the total variance explained by the two would be 30%), this varex value will be 20% for each of those, while "semi-partial R-squared" would be 10% for each, and the "normalized coefficient energy" (what we call "normalized variance explained") would be ~50% (dividing the shared variance equally).

Changes proposed in this pull request:

- Add the following new metrics:
    - "marginal R-squared": The "variance explained" for each component without controlling for other components.
    - "partial R-squared": The variance explained by each component after regressing the other components out of the data *and* the component itself. It is a conditional effect size.
    - "semi-partial R-squared": The variance explained by each component after regressing out the other components from the target component. It indicates the incremental increase in R-squared when adding the target component to the model.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c0828ac144a2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.