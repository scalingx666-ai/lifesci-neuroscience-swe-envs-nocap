# Issue

**Title:** allow more adc channels than dac channels

## Description

but causes ```abf.sweepUnisC```, ```abf.sweepLabelC```, and ```abf.sweepEpochs``` to be undefined in some cases.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `04db89e634c4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.