# Issue

**Title:** fix(worker): Use correct url encoding for rmet URLs

## Description

Fixes an issue where S3 incompatible URLs would be returned for certain characters (such as +).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `eecf0a246fc0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.