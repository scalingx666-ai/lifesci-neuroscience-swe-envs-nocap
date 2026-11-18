# Issue

**Title:** Enh/release/v3.0.0/enhanced bidsappman messages

## Description

1) Catches ValueError in order to pass Bidsvalidator Erromessages in a textbox message in cmpbidsappmanager.
2) Validates if Fressurfer License files is already in 'code' folder before starting the pipeline.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6ea3c2436010`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.