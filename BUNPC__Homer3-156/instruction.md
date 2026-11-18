# Issue

**Title:** Development

## Description

v1.71.0

-- Add EditStim method to TreeNodeClass to allow editing of events TSV files for the processing element.
-- Change menu option "Load Stim from TSV" to "Edit Stim TSV file", so that user doesn't have to go looking for the file in the dataset folder.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5fd7163f0b38`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.