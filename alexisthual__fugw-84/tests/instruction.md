# Issue

**Title:** [ENH] Stabilized and epsilon scaled sinkhorn solvers

## Description

This PR implements stabilized and epsilon scaled sinkhorn solvers (Schmitzer, B. 2016), supporting sparse cost matrices.

```
Schmitzer, B. (2016). Stabilized Sparse Scaling Algorithms for
        Entropy Regularized Transport Problems.
        arXiv preprint arXiv:1610.06519.
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `93c62a1ab37e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.