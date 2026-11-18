# Issue

**Title:** Reference interpolates instead of deletes channels manually marked as bad, closes #146

## Description

<!--Thanks for contributing-->
<!--If this is your first time, please make sure to read the contributing guideline-->
<!--https://github.com/sappelhoff/pyprep/blob/main/.github/CONTRIBUTING.md-->

# PR Description

 <!--Please describe your pull request here.-->

, an error that results from the `raw.pick_types` call inside `pyprep.Reference` deleting channels which have been marked as bad prior to PREP. These channels should now be interpolated instead.

A new field `'bad_manual'` is added to `noisy_channels_before_interpolation` dict so there's still a record the channel was interpolated. This happens inside `Reference`; the `NoisyChannels` class is untouched. 


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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `06fb37bb5db7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.