# Issue

**Title:** Power normalisation fixes

## Description

Changes:
- Fixed the calculation of the power (variance) from a PSD. [Switched from taking the mean to a summation.]
- Made sure the sum of power in different frequency bands gives the same power as the total frequency range.

I.e. in this PR we ensure:
```
power.variance_from_spectra(f, psd, frequency_range=[1,4])
+ power.variance_from_spectra(f, psd, frequency_range=[4,8])
```
gives the same power map as
```
power.variance_from_spectra(f, psd, frequency_range=[1,8])
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a5e9fccbaadf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.