# Issue

**Title:** RANSAC docstring improvements & related cleanup

## Description

<!--Thanks for contributing-->
<!--If this is your first time, please make sure to read the contributing guideline-->
<!--https://github.com/sappelhoff/pyprep/blob/master/.github/CONTRIBUTING.md-->

# PR Description

Basically, I started writing a new PR to add a public API for `matlab_strict` mode and ended up doing a bunch of unrelated cleanup of the RANSAC docstrings while I was at it. To keep things organized, I've moved all that cleanup to a separate PR here.

Basically, this PR:
- Makes RANSAC capitalization consistent throughout the docs (it's capitalized in the original paper, so that's what I stuck with here)
- Elaborated on the purposes and defaults for a lot of the RANSAC and RANSAC-related function/class parameters
- Removed an unnecessary argument (`signal_len`) to `find_bad_by_ransac`, since it's already contained in the shape of the input data
- Updated the .gitignore to exclude invisible files unless explicitly included, to filter out random types of system/IDE files we're not already excluding (e.g. `.DS_Store` files on macOS, which keep showing up in my git changes). I added this one on to here since I figured it was too minor to warrant a separate pull request.

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