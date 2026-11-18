# Issue

**Title:** Functional ransac

## Description

# PR Description

Made ransac methods into their function versions.
Then moved the functions into a standalone module called ransac.
Some changes were made to the parameters of the methods as a result.

Since I moved the stuff I dont know what to put in the RST for old entrances (ie :meth:NoisyChannels.run_ransac) and so on. This is now in :func:ransac.run_ransac. But we can move everything back to find_noisy_channels if that is a better way.

I also made the channel_correlations an output of the find_bad_by_ransac function for easier debugging, but I dont know if this is the best approach, so suggestions are welcome. It could also be a class that holds the end results (no mutable attributes), or maybe a dictionary.

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bfb2ab1ccbd3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.