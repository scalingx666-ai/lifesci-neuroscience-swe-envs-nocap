# Issue

**Title:** Retain detailed info about calculations during NoisyChannels

## Description

<!--Thanks for contributing-->
<!--If this is your first time, please make sure to read the contributing guideline-->
<!--https://github.com/sappelhoff/pyprep/blob/master/.github/CONTRIBUTING.md-->

# PR Description

In MATLAB PREP, various values and matrices calculated during findNoisyChannels are saved as part of the resulting EEG object. These include the raw correlation values for each RANSAC window and each correlation window, the calculated noisiness and deviations for each channel, the dropout windows, and more. MATLAB PREP also does some extra calculations with some of this data when generating reports that otherwise isn't used in bad channel detection (e.g. reporting the specific windows of high frequency noise across each channel). Here's what MatPREP retains for the initial, pre-interpolation, and post-interpolation findNoisyChannels runs:

![Screen Shot 2021-04-18 at 7 53 29 PM](https://user-images.githubusercontent.com/18648066/115163502-d16ffc00-a07f-11eb-99b6-d8b64aa517a1.png)

This PR makes PyPREP retain most of the same detailed info.

The immediate purpose of the PR is that this will make it a lot easier to do proper and detailed unit tests, especially for comparing values between PyPREP and MATLAB PREP. Instead of just testing channel detection output, we can now test whether specific values match up with what we expect.

The other purpose of the PR is that (at some point) we might want to make this part of the public API, so that people can access and dig into these values like they can with MATLAB PREP, and/or add functions to do the additional calculations with some of this data the way MatPREP does.

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `032cad16793a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.