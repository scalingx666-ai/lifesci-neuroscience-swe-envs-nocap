# Issue

**Title:** TVB-2946 Adjust sample rate in wavelet to be in kHz

## Description

In the past TimeSeries.sample_rate property was always returning 1/sample_period (which in most of the cases - e.g. the default simulations was returning kHz).

Changes in 2020 - 2021 into TimeSeries.sample_rate implementation improved that, to take into account the Ts.sample_period_unit, but also made the result Hz.

To reproduce results like here: https://docs.thevirtualbrain.org/tutorials/tutorial_1_BuildingYourOwnBrainNetworkModel.html#tutorial-1-buildingyourownbrainnetworkmodel
As reported here https://groups.google.com/g/tvb-users/c/lLT9j7i-ehI/m/KANAqlEKAQAJ?utm_medium=email&utm_source=footer, we should use in the Wavelet analyzer kHz.

@i-Zaak @maedoc  please have a look and confirm this is the right way to fix this bug

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `eb4b8c6b298a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.