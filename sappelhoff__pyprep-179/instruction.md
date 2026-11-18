# Issue

**Title:** ADD: bad_by_PSD method

## Description

<!--Thanks for contributing-->
<!--If this is your first time, please make sure to read the contributing guideline-->
<!--https://github.com/sappelhoff/pyprep/blob/main/.github/CONTRIBUTING.md-->

# PR Description
Building on @nabilalibou's work (), this PR adds functionality for finding bad channels using Power Spectral Density (PSD). This method is not part of the original MATLAB PREP pipeline and only runs when matlab_strict=False.

## Detection Criteria
A channel is flagged as "bad-by-PSD" if either:
1. Abnormally high band power: The channel has an outlier z-score (>3.0) in any of three frequency bands:
    - Low (1-15 Hz): delta, theta, alpha
    - Mid (15-30 Hz): beta
    - High (30-45 Hz): gamma
2. 1/f violation: The high-frequency band has more power than the low-frequency band, which violates the typical 1/f spectral profile of EEG and often indicates muscle artifact or poor electrode contact.


## Implementation Details
- PSD is computed using Welch's method over 1-45 Hz (configurable via fmin/fmax)
- Default frequency range excludes 50/60 Hz line noise
- Uses MAD-based robust z-scoring (scaled by 1.4826 to convert to SD units)
- Only flags positive z-scores (excess power), as abnormally low power may reflect normal topographic variation


## Changes from previous PR (#145)
1. Detects only high PSD (not low), since low power can be normal
2. Uses MAD-based robust statistics instead of standard z-scoring
3. Splits spectrum into three frequency bands instead of total power
4. Adds 1/f violation criterion to catch muscle artifacts
5. Includes bad_by_psd in the bad channels dictionary
6. Fixes KeyError in Reference.robust_reference() by adding bad_by_psd to the noisy channels tracking dict


- closes: 

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d54e5a4aad89`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.