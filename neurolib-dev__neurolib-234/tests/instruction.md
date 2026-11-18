# Issue

**Title:** removed Dmat_ndt as param set in timeIntegration file

## Description

This PR removes `params["Dmat_ndt"] = Dmat_ndt` as a parameter from the FHN, Hopf, WC, WW models because `Dmat_ndt` is derived from `lengthMat` and is not a parameter that should be set by the user.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `846c3f7925fa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.