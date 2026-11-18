# Issue

**Title:** [FIX] Null channels cause dss.dss0 to crash

## Description

## Description
When the values of `n_chans - 1` channels are set to zero, `dss.dss0()` returns a` ValueError: expected square matrix` message. This is because the passed input matrix `c2` is one-dimensional (because it has 1 feature only, corresponding to the not-null channel).

Proposed fix is to leave it 2-dimensional by removing `squeeze()`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `485f8befa847`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.