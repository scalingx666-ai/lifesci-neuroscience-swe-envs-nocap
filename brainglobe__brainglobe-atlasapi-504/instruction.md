# Issue

**Title:** Remove main script

## Description

This PR removes the main script that was originally intended to allow us to build all atlases and upload them in one go. I don't think this is practical any more considering the number of atlases and the general flakiness of GIN.

I think it's a concept we should come back to eventually, but it's more likely to be an HPC-based batch script rather than a python script that should live here. Happy to be corrected though.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cc0016968646`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.