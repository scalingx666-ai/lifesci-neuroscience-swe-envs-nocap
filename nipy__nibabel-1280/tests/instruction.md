# Issue

**Title:** MNT: Deprecate nibabel.pydicom_compat

## Description

This was added for the <1.0 to 1.0 transition. We no longer use it internally, and it's out-of-date with more recent deprecations in pydicom 2 that cause test failures in pydicom 3.0.0.dev0.

This PR switches the deprecated `read_file` to `dcmread` and deprecates our own compatibility shim. I suspect nobody is using it, so we'll give one release cycle and remove it in 7.0 (roughly 1yr).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `96abe5a34369`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.