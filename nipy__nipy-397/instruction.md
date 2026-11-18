# Issue

**Title:** MRG: prefer numpy pinv to scipy pinv

## Description

This is an alternative to #394.  In this PR, we switch from using
scipy.linalg.pinv to using numpy.linalg.pinv, on the basis that, at least as of
scipy 0.17, numpy pinv is more accurate, as measured by least squares sum of
squared errors.

This fixes the test failure we were getting from scipy 0.17 without the need to
relax the precision threshold (#394).

Of course, this PR might cause subtle changes in results.  On the other hand,
that will likely be true for scipy 0.17 compared to scipy 0.16 without this
change.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3a8c4db5b265`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.