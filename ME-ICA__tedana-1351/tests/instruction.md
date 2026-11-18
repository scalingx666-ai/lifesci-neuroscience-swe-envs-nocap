# Issue

**Title:** Generalize the generate_decision_table_score function

## Description

Closes none, but should make calculating variants of the `d_table_score` metric in #1337 easier..

Changes proposed in this pull request:

- Modify the `generate_decision_table_score ` function to accept two lists of 1D arrays (ascending and descending) instead of specific metrics.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `85fab4fe444e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.