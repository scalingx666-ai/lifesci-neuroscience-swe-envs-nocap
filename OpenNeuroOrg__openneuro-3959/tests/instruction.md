# Issue

**Title:** fix(server): Handle number formatted snapshot dates for assembleMetadata

## Description

Corrected fix for #3958. Fixing this in assembleMetadata but may try to consolidate these date formats for our next minor release.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `50244bc74949`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.