# Issue

**Title:** Fix ridgeline plot in IBMA report

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
Closes None.

<!-- Please give a brief overview of what has changed in the PR.
If you're not sure what to write, consider it a note to the maintainers to indicate
what they should be looking for when they review the pull request. -->
Changes proposed in this pull request:

- Replace the custom code based on seaborn, which was producing strange results for specific data.
- Ridgeplot is more straightforward and interactive given that it is based on Plotly.
- Another improvement is the ability to set the color gradient along the horizontal axis, which helps compare the different distributions from the images.

![seaborn-ridgeplot](https://github.com/neurostuff/NiMARE/assets/52050407/3cdf58ab-cf0e-4cdc-9ffc-62afc9556558)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `028f3089e10d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.