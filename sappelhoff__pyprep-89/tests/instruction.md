# Issue

**Title:** Use identical RNG state across RANSAC runs when matlab_strict enabled

## Description

<!--Thanks for contributing-->
<!--If this is your first time, please make sure to read the contributing guideline-->
<!--https://github.com/sappelhoff/pyprep/blob/master/.github/CONTRIBUTING.md-->

# PR Description

 (at least as far as MATLAB equivalence is concerned). This PR modifies `NoisyChannels` to always use a copy of the random state object during RANSAC when `matlab_strict` is True. This results in the random state being identical for each run of `NoisyChannels.find_bad_by_ransac`, matching MATLAB PREP.

Also I realize I forgot to update the `whats_new.rst` for the last PR, so I did that here as well!

# Merge Checklist

<!--To merge your PR we need to first take the following points into account.-->
<!--Please just leave this checklist untouched-->

- [x] the PR has been reviewed and all comments are resolved
- [x] all [CI][what-is-ci] checks pass
- [x] (if applicable): the PR description includes the phrase `closes #<issue-number>` to [automatically close an issue][auto-close-documentation]
- [x] (if applicable): bug fixes, new features, or [API][what-is-api] changes are documented in [whats_new.rst][whats-new-file]


[what-is-ci]: https://help.github.com/en/actions/building-and-testing-code-with-continuous-integration/about-continuous-integration
[auto-close-documentation]: https://help.github.com/en/github/managing-your-work-on-github/linking-a-pull-request-to-an-issue#linking-a-pull-request-to-an-issue-using-a-keyword
[what-is-api]: https://en.wikipedia.org/wiki/Application_programming_interface
[whats-new-file]: https://github.com/sappelhoff/pyprep/blob/master/docs/whats_new.rst

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b0c62ad3814a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.