# Issue

**Title:** Migrate to `np.isin`

## Description

# PR Summary
This small PR migrates `np.in1d` to `np.isin` in order to resolve the deprecation warnings:
```python
DeprecationWarning: `in1d` is deprecated. Use `np.isin` instead.
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cacdfb0cc78e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.