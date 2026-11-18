# Issue

**Title:** Add csd plus

## Description

This request implements the CSD+ constraints proposed in https://doi.org/10.1016/j.neuroimage.2019.116405, discussed also in #91. The constraints can be used by setting `solver='csd_plus'` when fitting the model. I've included a simple example based on the existing MC-CSD example. 

It is recommended to install the MOSEK solver for speed, cf. https://docs.mosek.com/latest/install/installation.html for installation. 

Some points:
- The maximum value for `sh_order` when using the constraints is currently 10, but this is not checked anywhere.
- The precomputed constraint matrices are stored as CSV files in dmipy/data/sos_constraints, but there is probably a more efficient way of storing/reading them.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1aac5a6fdb9b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.