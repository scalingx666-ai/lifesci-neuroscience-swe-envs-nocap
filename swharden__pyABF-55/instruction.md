# Issue

**Title:** Stimulus: Support custom protocol directories again

## Description

In ed261b00 (Epochs: Support loading custom waveforms from ATF files,
2018-07-24) support for loading custom waveforms was added.

But in later commits the feature that you can give pass in a custom
location where these protocols are stored was removed.

This feature is now resurrected. We don't need to care about caching as
that is done in ABF.sweepC.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b5a641c26bef`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.