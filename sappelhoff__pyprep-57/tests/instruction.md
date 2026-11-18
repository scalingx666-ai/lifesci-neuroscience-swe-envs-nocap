# Issue

**Title:** Add MATLAB-style implementations of the quantile and IQR functions

## Description

# PR Description

. As mentioned in that issue, MATLAB's quantile and IQR functions calculate quantiles slightly differently than Numpy and SciPy, leading to higher sensitivity to differences in channel correlation than in the original MATLAB PREP. This PR adds new `mat_quantile` and `mat_iqr` functions that match MATLAB's quantile logic and make PyPREP's internal correlation matrix for `NoisyChannels.find_bad_by_correlation` match the values in MATLAB PREP's equivalent matrix exactly.

### TODO

- I wasn't sure whether we'd want these functions to be part of the public API or private (i.e. `_mat_irq` and `_mat_quantile`) so I held off on writing docstrings.
- I also wasn't sure what we wanted to do here for unit testing. For the sake of this PR, would individual tests for these two functions be fine, or should we add full-pipeline testing of these changes as well? Eventually we'll want to modify the CI tests to do proper comparisons between MATLAB and PyPREP output values for each stage of NoisyChannels, but that would require figuring out some good test data we could use for both pipelines that wouldn't demand too much in terms of RAM or CPU, so I think that's a bigger problem to tackle in a separate PR.
- I need to update the changelog (which sort of depends on whether we want the functions to be public or private).

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `99be20c6a0f3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.