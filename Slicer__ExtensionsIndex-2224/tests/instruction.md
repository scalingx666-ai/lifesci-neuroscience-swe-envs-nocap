# Issue

**Title:** Removed Telemetry dependency from BoneReconstructionPlanner for Slicer-5.8

## Description

Slicer build fails due to Telemetry extension is not in the ExtensionsIndex but required by BoneReconstructionPlanner. Since Slicer-5.8 builds (and therefore extension updates) will stop within in a week it is better to not add the Telemetry extension now (which is still not widely tested and so may not be very mature). It is not a build-time dependency anyway and its installation is optional for the user.

FYI @mauigna06

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9eeb5ee1c70b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.