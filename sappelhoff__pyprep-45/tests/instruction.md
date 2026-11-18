# Issue

**Title:** added noisy_channels_before and _after interpolation attributes

## Description

Thanks for contributing.
If this is your first time, please make sure to read the [contributing guideline][contrib-guideline].

# PR Description

This PR adds two attributes to PrepPipeline:

- noisy_channels_before_interpolation
- noisy_channels_after_interpolation

Which are dictionaries with the detailed results of bad channels identified by each criteria, that is:

```python
noisy_channels_x_x = {
            "bad_by_nan": noisy_detector.bad_by_nan,
            "bad_by_flat": noisy_detector.bad_by_flat,
            "bad_by_deviation": noisy_detector.bad_by_deviation,
            "bad_by_hf_noise": noisy_detector.bad_by_hf_noise,
            "bad_by_correlation": noisy_detector.bad_by_correlation,
            "bad_by_SNR": noisy_detector.bad_by_SNR,
            "bad_by_dropout": noisy_detector.bad_by_dropout,
            "bad_by_ransac": noisy_detector.bad_by_ransac,
            "bad_all": noisy_detector.get_bads(),
        }
```
 

Also added two keys to ``PrepPipeline.noisy_channels_original``:
- bad_by_dropout
- bad_by_SNR

A test for the IOError when not enough channels to make predictions in ransac was implemented.

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `afc8190a9eb8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.