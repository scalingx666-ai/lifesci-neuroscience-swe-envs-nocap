# Issue

**Title:** dev: Pin Sphinx and relax Conda Linux test

## Description

Allow the Conda test on Travis on Linux to fail while we understand how
to fix it. The test has been blocking commits for too long.

Switch to default Xcode version on Travis. Version 7.3 started causing
errors.

Also allow NumPy >= 1.18, which fixes the bug that we were avoiding.

Also allow SciPy >= 1.3.0, because release 0.2.5 of Pymanopt is no longer holding it back.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e750060c8ba9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.