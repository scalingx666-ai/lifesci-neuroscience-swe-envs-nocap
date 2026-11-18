# Issue

**Title:** Small fixes

## Description

This PR fixes a few small issues in specific cases
- deleting streams in the UMS
- generating workflow without (over)writing provenance

and replace the try-catch block in `aas_getsourcestage` with more elegant condition check

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6377d85ca5e8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.