# Issue

**Title:** Fix digest type for SHA-256 in download.py

## Description

## What does this PR do?

Small fix when the digest type is incorrect in the files downloaded from Dryad for the conventions of `hashlib`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `32894bb633db`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.