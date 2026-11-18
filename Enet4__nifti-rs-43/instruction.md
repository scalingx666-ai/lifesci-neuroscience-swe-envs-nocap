# Issue

**Title:** Validate dimensionality

## Description

I found a problem while fuzzing the crate. If `dim[0]` contains an inappropriate value, attempting to read a volume would panic. This PR makes some changes to accommodate the fix.

- new error variant for inconsistent dim field values (must be positive, and `dim[0]` must not be higher than 7).
- raise this error if `dim[0]` is incorrect.
- as a bonus, I added public methods to `NiftiHeader`, which validate the values in the process.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6de3883f1894`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.