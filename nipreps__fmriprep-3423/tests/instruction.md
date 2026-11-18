# Issue

**Title:** feat: Add flag to fallback to Estimated* metadata or a passed value for TotalReadoutTime

## Description

This flag provides two additional ways to retrieve TotalReadoutTime. If `EstimatedTotalReadoutTime` or `EstimatedEffectiveEchoSpacing` are defined, the user can pass `--fallback-total-readout-time estimated` to direct fMRIPrep to use these.

This could be turned on by default, but I don't think this is prudent. The reason that `dcm2niix` does not simply say `TotalReadoutTime` or `EffectiveEchoSpacing` is not to misrepresent the confidence that these are correct. Previously, users had to actively remove the `Estimated` to accept the estimates, and I don't think we want to eliminate the conscious decision. However, we can make it so that users do not need to modify their datasets to accept them.

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9da3867bb48f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.