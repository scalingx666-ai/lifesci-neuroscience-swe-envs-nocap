# Issue

**Title:** Add initial tests for removeTrend & NoisyChannels

## Description

<!--Thanks for contributing-->
<!--If this is your first time, please make sure to read the contributing guideline-->
<!--https://github.com/sappelhoff/pyprep/blob/master/.github/CONTRIBUTING.md-->

# PR Description

. This PR aims to add direct CI comparison of PyPREP's `matlab_strict`results to Matlab PREP's across every stage of the pipeline, verifying that we're not deviating from MatPREP in any ways we're not actively aware of.

This is currently in a draft state, with only removeTrend and NoisyChannels being tested for equivalence, but I figure this would be a useful stage at which to get some feedback.

### Components currently tested

- [x] removeTrend
- [ ] CleanLine (`mne.filter.notch_filter`)
- [x] NoisyChannels
   - [x] Bad by NaN
   - [x] Bad by flat
   - [x] Bad by deviation
   - [x] Bad by HF noise
   - [x] Bad by correlation
   - [x] Bad by low SNR
   - [x] Bad by dropout
   - [x] Bad by RANSAC
- [ ] Robust re-referencing
- [ ] Final bad channel interpolation
- [ ] Full pipeline, start-to-finish

### Current thoughts

- The current test file I chose apparently only has two bad channels (T10 and FT8), none of which are bad by NaN, flat, SNR, or deviation. One possibility would be to try and find another test file that's noisier, another would be to try and simulate these types of noise as part of our `matlab_artifacts` script. Simulating bad-by-SNR is likely more trouble than just finding a noisier file, but I haven't found any data with bad-by-NaN or bad-by-dropout channels yet so I think simulation is the way to go for those.
- What do we want to do about the `examples/run_full_prep.py` script? Once #58 is finally finished it'll need to be rewritten a bit, but should we switch to using `matprep_artifacts` as the test data for that as well?
- How do we want to approach merging this? Should I write tests for the whole thing and mark the ones that aren't numerically-equivalent yet as expected failures, or should we merge once NoisyChannels tests are complete and add to this with future PRs when adding `matlab_strict` modes for things like re-referencing and final interpolation?

# Merge Checklist

<!--To merge your PR we need to first take the following points into account.-->
<!--Please just leave this checklist untouched-->

- [x] the PR has been reviewed and all comments are resolved
- [x] all [CI][what-is-ci] checks pass
- [x] (if applicable): the PR description includes the phrase `closes #<issue-number>` to [automatically close an issue][auto-close-documentation]
- [ ] (if applicable): bug fixes, new features, or [API][what-is-api] changes are documented in [whats_new.rst][whats-new-file]


[what-is-ci]: https://help.github.com/en/actions/building-and-testing-code-with-continuous-integration/about-continuous-integration
[auto-close-documentation]: https://help.github.com/en/github/managing-your-work-on-github/linking-a-pull-request-to-an-issue#linking-a-pull-request-to-an-issue-using-a-keyword
[what-is-api]: https://en.wikipedia.org/wiki/Application_programming_interface
[whats-new-file]: https://github.com/sappelhoff/pyprep/blob/master/docs/whats_new.rst

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `20e294125c41`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.