# Issue

**Title:** Ignore unselected subjects in BIDSLayoutIndexer

## Description

.

## Changes proposed in this pull request

- Incorporate a regular expression in the `ignore` list of the `BIDSLayoutIndexer` that flags subjects who are _not_ in `Config.participant_label` (when provided).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3d0d0b65fdf0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.