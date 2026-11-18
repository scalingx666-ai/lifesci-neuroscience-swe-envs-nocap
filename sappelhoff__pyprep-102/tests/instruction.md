# Issue

**Title:** Always keep EEG data in Volts instead of converting to mV

## Description

<!--Thanks for contributing-->
<!--If this is your first time, please make sure to read the contributing guideline-->
<!--https://github.com/sappelhoff/pyprep/blob/master/.github/CONTRIBUTING.md-->

# PR Description

This PR removes a bunch of unnecessary conversions back and forth between Volts and mV, likewise changing the units for a few user-facing EEG attributes (e.g. `self.EEG_before_interpolation`) in `PrepPipeline` from the EEGLAB standard of mV to the MNE standard of volts.

This should make the API less confusing for people used to working in the MNE world, avoid a bunch of unnecessary large matrix multiplication, and makes some other proposed API changes in #99 easier to implement.

# Merge Checklist

<!--To merge your PR we need to first take the following points into account.-->
<!--Please just leave this checklist untouched-->

- [x] the PR has been reviewed and all comments are resolved
- [x] all [CI][what-is-ci] checks pass
- [ ] (if applicable): the PR description includes the phrase `closes #<issue-number>` to [automatically close an issue][auto-close-documentation]
- [ ] (if applicable): bug fixes, new features, or [API][what-is-api] changes are documented in [whats_new.rst][whats-new-file]


[what-is-ci]: https://help.github.com/en/actions/building-and-testing-code-with-continuous-integration/about-continuous-integration
[auto-close-documentation]: https://help.github.com/en/github/managing-your-work-on-github/linking-a-pull-request-to-an-issue#linking-a-pull-request-to-an-issue-using-a-keyword
[what-is-api]: https://en.wikipedia.org/wiki/Application_programming_interface
[whats-new-file]: https://github.com/sappelhoff/pyprep/blob/master/docs/whats_new.rst

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7ad292cadab8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.