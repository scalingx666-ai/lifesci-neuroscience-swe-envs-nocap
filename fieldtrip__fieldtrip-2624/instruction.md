# Issue

**Title:** incremental algorithmic flexibility for spectral estimation

## Description

This PR adds some new algorithmic flexibility to DPSS-taper based analysis for ft_specest_mtmfft, and ft_specest_irasa.

Specifically, for mtmfft adaptive taper weighting is further refined, where it's now also possible to correct the spectral estimates by an estimate of the within-smoothing-bandwidth estimates of the spectrum's curvature.

For irasa, there is improved support to use DPSS-tapering (rather than the default Hanning taper) for the spectral estimates + non-default outputs are now supported (e.g. not taking geometric means per resampling factor, and/or outputting the individual spectra after stretching/compression). Also, before taking the median across resampling factors, frequency bins that go beyond the original signal's Nyquist frequency after upsampling, are discarded. This now avoids the typical drop in power of the irasa fractal spectrum at high frequencies.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `77ff5f572c58`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.