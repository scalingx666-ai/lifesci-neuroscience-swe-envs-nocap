# Issue

**Title:** ENH: Updated the expected test results for several tests.

## Description

All of the updated tests were for for Brains Constellation Detector.
New test images were created from the output test data and uploaded to Kitware data [here](https://data.kitware.com/#folder/61a52b162fa25629b96b43df). After this fix only one level 3 test fails (BRAINSABCSmallTest) due to a timeout.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fdff2d1e3d11`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.