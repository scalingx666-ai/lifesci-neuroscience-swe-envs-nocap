# Issue

**Title:** FIX: manually marked bad channels must be excluded in find bads

## Description

<!--Thanks for contributing-->
<!--If this is your first time, please make sure to read the contributing guideline-->
<!--https://github.com/sappelhoff/pyprep/blob/main/.github/CONTRIBUTING.md-->

# PR Description

Sometimes we know in advance that a channel is bad and we want to explicitly exclude it. This is possible by marking it as bad *before* finding additional bad channels.


 <!--Please describe your pull request here.-->

# Merge Checklist

<!--To merge your PR we need to first take the following points into account.-->
<!--Please just leave this checklist untouched-->

- [ ] the PR has been reviewed and all comments are resolved
- [ ] all [CI][what-is-ci] checks pass
- [ ] (if applicable): the PR description includes the phrase `closes #<issue-number>` to [automatically close an issue][auto-close-documentation]
- [ ] (if applicable): the changes are documented in the changelog [changelog.rst][changelog]
- [ ] (if applicable): new contributors have added themselves to the authors list in the [`CITATION.cff`][citationcff] file


[what-is-ci]: https://help.github.com/en/actions/building-and-testing-code-with-continuous-integration/about-continuous-integration
[auto-close-documentation]: https://help.github.com/en/github/managing-your-work-on-github/linking-a-pull-request-to-an-issue#linking-a-pull-request-to-an-issue-using-a-keyword
[changelog]: https://github.com/sappelhoff/pyprep/blob/main/docs/changelog.rst
[citationcff]: https://github.com/sappelhoff/pyprep/blob/main/CITATION.cff

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `65976a848675`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.