# Issue

**Title:** Implement EEGLAB-style interpolation in Reference for matlab_strict

## Description

<!--Thanks for contributing-->
<!--If this is your first time, please make sure to read the contributing guideline-->
<!--https://github.com/sappelhoff/pyprep/blob/master/.github/CONTRIBUTING.md-->

# PR Description

. This PR basically reimplements most of EEGLAB's `eeg_interp` method in Python so we can finally do MATLAB equivalence tests for the entirety of the `Reference` class (also added in this PR). This was... *not easy* to say the least, but it was necessary for the peace of mind that these MatPREP comparison CI tests allow (and also helped us identify a bunch of other small bugs/discrepancies along the way).

This is also the last numeric difference from MatPREP I'm aware of other than adaptive line noise removal (and differences between EEGLAB's montage-importing code and MNE's which result in differences in RANSAC, but that's not exactly a *PREP* divergence as much as an EEGLAB/MNE one).

Anyway, I've tried my best to make sense of and comment/document the re-implemented EEGLAB logic, but there are still a few areas I don't fully understand. If you have any insights, please let me know!

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3625b26689af`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.