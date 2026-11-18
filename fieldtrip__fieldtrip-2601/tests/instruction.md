# Issue

**Title:** Eyelink asc

## Description

This PR is an overhaul of the read_eyelink_asc code, allowing for more robust handling of eyelink asc files.

Specifically, previously the code did not deal with discontinuous data correctly.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ee26c7403317`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.