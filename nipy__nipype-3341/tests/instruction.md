# Issue

**Title:** MNT: Remove deprecated np.float usage

## Description

Wanted to run this one by people rather than tucking into #3336.

Because `np.float` is just `__builtins__.float`, which is in turn promoted to `np.float64` when used as a dtype, this should have no effect. Just want to make sure that this is what's intended in these cases.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d02750a3f8b7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.