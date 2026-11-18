# Issue

**Title:** feat(server): Add syncDatasetDois mutation to bulk update the DOIs records for all snapshots

## Description

Add a mutation to sync the datacite DOI metadata for all snapshots of a given dataset and update the state based on if the snapshot has been deprecated. Includes a dry run flag and a response field to preview the metadata sent to allow for scripting bulk updates with quick review.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6dd7acdeec7f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.