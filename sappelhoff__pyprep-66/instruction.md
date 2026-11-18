# Issue

**Title:** Add window-wise RANSAC to reduce RAM requirements

## Description

<!--Thanks for contributing-->
<!--If this is your first time, please make sure to read the contributing guideline-->
<!--https://github.com/sappelhoff/pyprep/blob/master/.github/CONTRIBUTING.md-->

# PR Description

(Updated) This PR does a few things:

- Adds support for window-wise RANSAC and makes it the default method
- Reworks channel-wise RANSAC to use the same pre-generated interpolation matrices as window-wise, which speeds things up and reduces the amount of divergent/redundant code between methods
- Reworks/refactors the channel-wise RANSAC functions a fair bit to better match the function names, argument names, variable names, and docstrings of their window-wise equivalence, for easier comparison and maintainability
- Adds a progress-printing function for window-wise RANSAC
- Overhauls the RANSAC unit tests considerably, including the addition of explicit comparison of the window-wise/channel-wise correlation matrices for both regular and MATLAB-strict RANSAC to make sure we get identical results for the same seed between methods (and that MATLAB strict values differ from non-strict ones as expected).

### Currently Missing
- [x] Progress indicators for RANSAC
- [x] Proper API for `matlab_strict` mode (handled in earlier PR)
- [ ] Any sort of optimization/parallelization for additional speed (I have some ideas, but will save for a future PR since this one's already pretty big)
- [x] Any sort of memory checking or channel chunking support (added memory check at start)
- [x] A clear idea of what to do about MATLAB PREP's weird correlation function (handled in earlier PR)

### Other Notes
- For my test file (`sub_002/ses-01` from that open meditation dataset), window-wise RANSAC is about 36% slower than the existing RANSAC approach (192 vs 141 seconds). However, RAM usage during RANSAC is now much lower (maxed out at 2.85 GB), which is nice but also suggests that window-wise RANSAC could be improved to take better advantage of RAM on beefier systems.

# Merge Checklist

<!--To merge your PR we need to first take the following points into account.-->
<!--Please just leave this checklist untouched-->

- [x] the PR has been reviewed and all comments are resolved
- [x] all [CI][what-is-ci] checks pass
- [ ] (if applicable): the PR description includes the phrase `closes #<issue-number>` to [automatically close an issue][auto-close-documentation]
- [x] (if applicable): bug fixes, new features, or [API][what-is-api] changes are documented in [whats_new.rst][whats-new-file]


[what-is-ci]: https://help.github.com/en/actions/building-and-testing-code-with-continuous-integration/about-continuous-integration
[auto-close-documentation]: https://help.github.com/en/github/managing-your-work-on-github/linking-a-pull-request-to-an-issue#linking-a-pull-request-to-an-issue-using-a-keyword
[what-is-api]: https://en.wikipedia.org/wiki/Application_programming_interface
[whats-new-file]: https://github.com/sappelhoff/pyprep/blob/master/docs/whats_new.rst

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `145a5a16d372`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.