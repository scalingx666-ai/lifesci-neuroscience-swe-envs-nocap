# Issue

**Title:** prevent nan or inf in mesh

## Description

added now
```
is_finite = np.isfinite(_mesh)
_mesh[~is_finite] = np.percentile(_mesh[is_finite], 5)
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a44d94de5005`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.