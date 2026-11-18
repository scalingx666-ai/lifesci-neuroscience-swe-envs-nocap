# Issue

**Title:** Develop

## Description

Fixed smoothing behavior.
Also fixed hemisphere indexing inside add_activation (it used to break when I changed hemisphere to 'both' in the meg_inverse_solution example).  
I tested some corner cases but I didn't write or run any unit tests.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9f54d944a18f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.