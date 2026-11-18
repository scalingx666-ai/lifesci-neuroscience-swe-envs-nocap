# Issue

**Title:** Turn off hard-coded histogram matching in registration

## Description

Left an option for backwards compatibility, with a note that users should prefer ants.histogram_match2.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f14370b3d896`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.