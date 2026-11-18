# Issue

**Title:** Document tracking system parameters

## Description

.

The `tracking_system` and `tracking_systems` parameters did not explain how
their values map to BIDS filenames.

This update identifies them as Motion-BIDS parameters, connects them to the
`tracksys` entity, distinguishes the concise filename label from the
human-readable `TrackingSystemName` metadata, and uses the specification's
`omcA` example.

Checks: all pre-commit hooks pass on the changed files.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f2c4c8b3dcda`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.