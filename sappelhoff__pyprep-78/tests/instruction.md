# Issue

**Title:** Change initial re-referencing state in Reference to match Matlab PREP

## Description

<!--Thanks for contributing-->
<!--If this is your first time, please make sure to read the contributing guideline-->
<!--https://github.com/sappelhoff/pyprep/blob/master/.github/CONTRIBUTING.md-->

# PR Description

 and . This PR fixes two separate (but related) issues:

- Unlike PyPREP, MatPREP considers bad-by-SNR channels to be 'unuseable' for its initial average reference (in addition to bad-by-NaN and bad-by-flat channels)
- Unlike PyPREP, MatPREP only flags the above "unusable" channels for permanent exclusion from being reference channels after the first noisy channels pass. PyPREP includes bad channels detected by all methods from this pass as permanently unusable, which doesn't necessarily make sense if the data isn't already average referenced (e.g. single-channel referenced or CMS/DRL).

With these fixes, PyPREP and Matlab PREP have identical values during re-referencing up until the second pass of NoisyChannels ().

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `339d90aed755`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.