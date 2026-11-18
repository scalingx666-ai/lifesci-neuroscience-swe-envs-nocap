# Issue

**Title:** New process for PSD deviation maps

## Description

Hello,

This pull requests include several updates on processes.

1. **New process for normative modelling : ~~process_comp_to_normative~~ process_test_normative**
I created this process to create deviation maps from a normative distribution of features.
This process takes as input the timefreq files (PSDs), from data, matrix or source files, for which we want to generate the deviation map in input A and the normative timefreq files in input B. It outputs the deviation map for each file in A which is a ~~stat~~ timefreq file where TF contains the deviations for each frequency bin and location (either sensors or sources) of interest. The value will be considered as a deviation if it falls outside the quantiles of the z-scored normative distribution for levels p/2 and 1-p/2 with p a level chosen by the user. It also allows for considering the distribution as normal and then uses the quantiles from a normal distribution.

2. **Extract mean, std and coefficient of variation: process_psd_features**
A new process allows then to extract the mean, std and coefficient of variation (varcoef) as three distinct files.

3. **Update on PSD computation**
    This update implements several options.
    1. Use relative power
    This option allows for considering the relative power (power divided by the total power for all frequency bins) instead of the absolute power in each time window when computing the PSD.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3e6b3712af7c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.