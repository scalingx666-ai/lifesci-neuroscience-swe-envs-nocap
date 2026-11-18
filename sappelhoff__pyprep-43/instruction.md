# Issue

**Title:** [BUG] Fix random seed consistency

## Description

# PR Description

This PR is meant to fix the secondary issue discovered in issue #41: that is, the inability to get consistent robust re-referencing results with a random seed if different numbers of chunks were used across runs. I've tested it locally with data and it's consistent across different manually-set chunk sizes, so I *think* it's working okay, but please let me know if you can think of any problems with this approach!

# Merge Checklist

To merge your PR we need to first take the following points into account:

- [ ] the PR has been reviewed and all comments are resolved
- [ ] all [CI][what-is-ci] checks pass
- [ ] (if applicable): the PR description includes the phrase `closes #<issue-number>` to [automatically close an issue][auto-close-documentation]
- [ ] (if applicable): bug fixes, new features, or [API][what-is-api] changes are documented in [whats_new.rst][whats-new-file]

[contrib-guideline]: https://github.com/sappelhoff/pyprep/blob/master/.github/CONTRIBUTING.md

[what-is-ci]: https://help.github.com/en/actions/building-and-testing-code-with-continuous-integration/about-continuous-integration

[auto-close-documentation]: https://help.github.com/en/github/managing-your-work-on-github/linking-a-pull-request-to-an-issue#linking-a-pull-request-to-an-issue-using-a-keyword

[what-is-api]: https://en.wikipedia.org/wiki/Application_programming_interface

[whats-new-file]: https://github.com/sappelhoff/pyprep/blob/master/docs/whats_new.rst

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `89a05507adef`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.