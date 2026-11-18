# Issue

**Title:** Update schema with probe_ids and global_contact_order

## Description

In main we added optional `probe_ids` and `global_contact_order` to the probegroup. This PR adds them to the schema.

Fixes failng tests in library here:

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `87410e103ca8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.