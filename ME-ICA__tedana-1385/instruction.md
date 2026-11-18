# Issue

**Title:** Fix PCA variance explained log output to show correct percentages

## Description

## Summary 
The explained_variance_total values from mapca are ratios (0-1), but were being displayed with a % suffix without first converting to percentages. This produced misleading output like "90% varexp: 0.901%" instead of "90% varexp: 90.1%".

Multiply `explained_variance_total` vals by 100 before displaying. The `all_varex` array used for the variance explained plot is left unchanged since the plot y-axis expects 0-1 range.

## Tests

Verified correct output on personal data, please try on yours, too. Also did pytest —skipintegration tedana/tests: 218 passed.  

Please let me know if I did anything wrong!

<!---
This is a suggested pull request template for tedana.
It's designed to capture information we've found to be useful in reviewing pull requests.

If there is other information that would be helpful to include, please don't hesitate to add it!

Please also label your pull request with the relevant tags.
See here for more information and a list of available options:
https://github.com/ME-ICA/tedana/blob/main/CONTRIBUTING.md#pull-requests
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

- Multiply `explained_variance_total` vals by 100 before displaying.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c7609b108ced`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.