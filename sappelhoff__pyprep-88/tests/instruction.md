# Issue

**Title:** Refactor & improved documentation of NoisyChannels

## Description

<!--Thanks for contributing-->
<!--If this is your first time, please make sure to read the contributing guideline-->
<!--https://github.com/sappelhoff/pyprep/blob/master/.github/CONTRIBUTING.md-->

# PR Description

This has been sitting half-done for a while now, but I've finally got this into a good draft state! This PR is a major cleanup of the code/docs for the non-RANSAC `NoisyChannels` methods, including:

- Splitting the code for each method into small, documented chunks
- Moving he code for 50 Hz bandpass filtering to its own separate private method, so that all noisy detection methods can be run independently/repeatedly without accidental re-filtering of the data, and that we ensure the data is always filtered pre-RANSAC.
- Rewriting the docstrings for the class and all the methods to better explain what they all do, now that I've mostly wrapped my head around the logic
- Implemented a simple `madmed` function in utils to replace `robust.mad` for a mild speed boost, which also removes the entire dependency of `statsmodels`
- Refactoring `find_bad_by_correlation` to avoid division-by-zero and the related warning suppression code
- Identifying and documenting some magic numbers

Some other stuff I noticed but didn't clean up yet:
- The bad window fraction threshold is `frac_bad` for the bad-by-correlation method, but is `fraction_bad` for the bad-by-RANSAC method. Should these be made consistent?
- Technically bad-by-deviation, bad-by-correlation, and bad-by-dropout channels are all supposed to be detected and excluded prior to RANSAC, but right now the code doesn't enforce this. Should we add a chunk of code to ensure those have all been run first?
- For RANSAC, the name of the argument specifying the proportion of channels to use per sample is `sample_prop` in the docstring, but `fraction_good` in the function definition. Since `fraction_good` isn't technically accurate anymore, I'm assuming I should switch to `sample_prop` throughout?

This doesn't really move us any closer to 0.4.0, but I find code cleanup like this sort of relaxing so it was nice to pick away at between other work. Also, please let me know if any of the new code or docs is unclear!

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bad637e2a1f4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.