# Issue

**Title:** fix(worker): Add validation for worker ids and match dataset values to worker

## Description

Validate worker id format and accession number matches the worker, this will throw an error when making git requests to the wrong worker.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `85c93e062734`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.