# Issue

**Title:** Fix large performance regression in _mat_quantile

## Description

<!--Thanks for contributing-->
<!--If this is your first time, please make sure to read the contributing guideline-->
<!--https://github.com/sappelhoff/pyprep/blob/master/.github/CONTRIBUTING.md-->

# PR Description

I've been taking a break from PyPREP work for a bit to work on actual research projects, but yesterday I noticed while re-running PyPREP on my dataset with the latest commit that the time between RANSAC iterations seemed much longer than it used to. Breaking out cProfile and SnakeVis, I profiled the code for a single file and found that `_mat_quantile` and `_mat_iqr` were eating up a big chunk of the total runtime:

![Screen Shot 2021-05-31 at 10 23 26 PM](https://user-images.githubusercontent.com/18648066/120253960-1f6f4680-c25f-11eb-876d-4b5965e32700.png)

Apparently, numpy's `apply_along_axis` function is famously slow, as are its `nanpercentile` and `nanquantile` functions. Luckily, I happened upon a [blog post](https://krstn.eu/np.nanpercentile()-there-has-to-be-a-faster-way/) of someone with a similar issue and adapted their solution to our use-case, so `_mat_iqr` and `_mat_quantile` are now fully vectorized while still handling NaNs properly!

On my local machine, this fix reduces the total time required to run the test suite from ~115 seconds down to about 50.

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f3f20248d961`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.