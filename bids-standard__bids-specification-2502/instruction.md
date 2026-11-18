# Issue

**Title:** [FIX] Update dbGaP advanced search URL

## Description

## Summary

Update the dbGaP Advanced Search link to its current NCBI URL.

## Why

The previous `/gap/advanced` endpoint now returns 404, which causes the external link check to fail on `master` and downstream pull requests.

## Checks

- confirmed that the new URL returns HTTP 200
- parsed `src/schema/objects/metadata.yaml`
- ran `git diff --check`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7eecacfa6303`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.