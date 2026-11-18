# Issue

**Title:** Make noisy channel exclusion during Reference compatible with MATLAB PREP

## Description

<!--Thanks for contributing-->
<!--If this is your first time, please make sure to read the contributing guideline-->
<!--https://github.com/sappelhoff/pyprep/blob/master/.github/CONTRIBUTING.md-->

# PR Description

. This PR does three main things:

- Changes `Reference.robust_reference` to stop permanently excluding channels that are flagged as bad-by-SNR prior to initial re-referencing.
- Changes `Reference.robust_reference` to exclude bad-by-dropout channels from the full set of bad channels when`matlab_strict` is `True`, matching MatPREP's (likely accidental) behaviour.
- Adds an `as_dict` argument to `NoisyChannels.get_bads` that returns bad channels by type as a dictionary in order to facilitate the above changes. In addition to being generally useful, it also saves a lot of dict construction in `reference.py`.

I still need to update the `whats_new.rst` and `matlab_differences.rst` here, but I figured given the time-zone difference that it would be better to get the code up for review before I went to bed. Thanks in advance for checking this over!

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4614ca01f4e8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.