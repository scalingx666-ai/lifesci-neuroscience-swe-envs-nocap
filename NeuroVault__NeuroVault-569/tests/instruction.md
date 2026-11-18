# Issue

**Title:** Downloaded files keep the full name for the zip file.

## Description

For Collections with names `test_collection` the generated zipfile name is `test_collection.zip`. 
For Collections with names `test collection` the generated zipfile name is `test` due to the space between words. 

Small change to correct this issue, replacing spaces for underscores.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6ee159d9542d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.