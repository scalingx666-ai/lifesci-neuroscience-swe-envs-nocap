# Issue

**Title:** haemodynamic delay

## Description

Major: 
This PR fixes the hard-coded haemodynamic delay in nfb_calc, which so far considered the last 5-6 volumes of the blocs regardless of length.

Minor:
This PR also 
- fixes a numpy-compatibility issue
- adds application icon as an ico-file

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `30e784adf92c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.