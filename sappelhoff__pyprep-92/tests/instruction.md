# Issue

**Title:** Ensure all reference channels are used during final average referencing

## Description

<!--Thanks for contributing-->
<!--If this is your first time, please make sure to read the contributing guideline-->
<!--https://github.com/sappelhoff/pyprep/blob/master/.github/CONTRIBUTING.md-->

# PR Description

. This PR fixes the issue by making `reference_channels` a local variable within `Reference.robust_reference()` so that it doesn't affect the `self.reference_channels` variable that's used to select reference channels during `Reference.perform_reference()`.

As an aside, is there any situation where it would make sense to only use a subset of all channels for final average reference calculation, post-interpolation? Wondering if the whole `reference_channels` parameter is a carry-over from MatPREP that only exists because EEGLAB doesn't have as nice a method of marking non-EEG channels as MNE. In MatPREP, channels are excluded from being sources for interpolation if they're not specified in the "reference channels" parameter, whereas PyPREP just uses all non-bad EEG channels, but I'm not sure if that would ever actually be a problem.

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6abe0bcf1d1d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.