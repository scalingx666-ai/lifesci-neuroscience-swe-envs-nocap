# Issue

**Title:** adaptive multitaper weighing for mtmfft

## Description

The multitaper spectral analysis methods literature advocates adaptive weighing of individually tapered Fourier transforms to improve the bias/variance properties of the spectra. This adaptive weighing also seems to be the default in MATLAB these days (i.e. the pmtm function). I played around with this a bit, and although it does not seem to have a huge impact in general, I can imagine some usecases where squeezing a little bit more signal out of single trial spectral estimates may be beneficial.
Another potential application domain may be in the estimation of 1/f slopes -> multitapering inherently 'assumes' the signal to have a white spectrum over the spectral concentration bandwidth, which will lead to an understimation of the actual slope if classical averaging across tapers is used.

The current PR is based on (python) code from G.Prieto (e.g. see Geophys.J.Int. 2007:https://doi.org/10.1111/j.1365-246X.2007.03592.x , but the technique has also been described in the Percival/Walden book).

In the process, I also made some (hopefully non-functional) tweaks to ft_freqanalysis

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bddfa627d4c7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.