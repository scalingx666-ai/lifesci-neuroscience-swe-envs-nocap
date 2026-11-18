# Issue

**Title:** MNT change default fsl-prefix and 2D colormap

## Description

`fsl_prefix` is needed to be specified only if FSL is installed with NeuroDebian (and users do not want to source it with `/etc/fsl/fsl.sh` every time). However, FSL is stuck to 5.0 in NeuroDebian, and most people would install FSL with other means (e.g. the python FSL installer). So I think we should set the prefix to blank by default ().

This PR also changes the default 2D colormap from RdBu_covar to PU_BuOr_covar, which I believe is a better default.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ce0a4d334e7f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.