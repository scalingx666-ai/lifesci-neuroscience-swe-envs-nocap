# Issue

**Title:** Multiplicative network coupling

## Description

Add multiplicative network coupling to `MultiModel.Network`. Now we have additive, diffusive, multiplicative, and no coupling.
(yes, I need it for paper replication :) )

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `714eef48616a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.