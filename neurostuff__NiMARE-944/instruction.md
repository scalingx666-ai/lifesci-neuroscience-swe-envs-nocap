# Issue

**Title:** [MAINT] bump to nilearn >= 0.12.1

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

- fix nilearn private imports
- bump nilearn version and its transitive dependencies

## Summary by Sourcery

Ensure compatibility with nilearn>=0.12.1 by updating dependency version bounds and adapting private nilearn imports

Enhancements:
- Bump nilearn requirement to >=0.12.1 and remove upper bound
- Upgrade nibabel, numpy, pandas, and scipy minimum versions to match nilearn’s updated dependencies
- Refactor private imports from nilearn._utils to their new cache_mixin and niimg_conversions modules

Build:
- Update setup.cfg install_requires with new version constraints for dependencies

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cdc70091194b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.