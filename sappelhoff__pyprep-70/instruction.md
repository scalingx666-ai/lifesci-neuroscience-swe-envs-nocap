# Issue

**Title:** Add matlab_strict API for matching MATLAB PREP's correlations and medians during RANSAC

## Description

<!--Thanks for contributing-->
<!--If this is your first time, please make sure to read the contributing guideline-->
<!--https://github.com/sappelhoff/pyprep/blob/master/.github/CONTRIBUTING.md-->

# PR Description

.

This PR introduces a new argument for the main PyPREP functions/classes called `matlab_strict`, which overrides PyPREP's deliberate differences in defaults over MATLAB PREP to produce identilcal results. Support for MatPREP-style median calculation and correlation calculation during RANSAC have both been added and wrapped in this API. 

I also added a draft of a documentation page explaining where PyPREP deviates intentionally from MatPREP and why, since I figured that would be a useful thing for users (and developers) to have. I _should_ add references to it wherever `matlab_strict` is mentioned, but it's late here and I didn't want to wait another day before getting this up here for initial review.

Let me know what you think!

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6689155b91bb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.