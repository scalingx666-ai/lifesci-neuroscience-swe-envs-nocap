# Issue

**Title:** [WIP] Fix Entity Table Order

## Description

Following the table order it will reorder the key accordingly. [Link](https://bids-specification.readthedocs.io/en/latest/99-appendices/04-entity-table.html#appendix-iv-entity-table).

We let some space for extensions but will put a warning if this happens (to do).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5080559d9056`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.