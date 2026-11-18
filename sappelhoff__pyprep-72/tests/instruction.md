# Issue

**Title:** Skip RANSAC predictions for channels already confirmed as bad

## Description

<!--Thanks for contributing-->
<!--If this is your first time, please make sure to read the contributing guideline-->
<!--https://github.com/sappelhoff/pyprep/blob/master/.github/CONTRIBUTING.md-->

# PR Description

Started work on finishing up #66 and ended up noticing this in the process. Essentially, MATLAB PREP doesn't bother to do RANSAC predictions/correlations for channels that have already been flagged as unsuitable for use as RANSAC predictors (i.e., bad by correlation, deviation, or dropout). Instead, those rows in the correlation matrix get filled with ones, so those channels are never "bad-by-RANSAC" (since they're already confirmed bad by something else).

Anyway, this reduces the RAM requirements for channel-wise RANSAC and also ends up simplifying the existing RANSAC code quite a bit (since we no longer need to pass the lists of complete/good channels all the way down to `_get_ransac_pred` to transform good channel indices to complete channel indices).

# Merge Checklist

<!--To merge your PR we need to first take the following points into account.-->
<!--Please just leave this checklist untouched-->

- [x] the PR has been reviewed and all comments are resolved
- [ ] all [CI][what-is-ci] checks pass
- [ ] (if applicable): the PR description includes the phrase `closes #<issue-number>` to [automatically close an issue][auto-close-documentation]
- [x] (if applicable): bug fixes, new features, or [API][what-is-api] changes are documented in [whats_new.rst][whats-new-file]


[what-is-ci]: https://help.github.com/en/actions/building-and-testing-code-with-continuous-integration/about-continuous-integration
[auto-close-documentation]: https://help.github.com/en/github/managing-your-work-on-github/linking-a-pull-request-to-an-issue#linking-a-pull-request-to-an-issue-using-a-keyword
[what-is-api]: https://en.wikipedia.org/wiki/Application_programming_interface
[whats-new-file]: https://github.com/sappelhoff/pyprep/blob/master/docs/whats_new.rst

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0fa6ac41acbe`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.