# Issue

**Title:** Minor fixes: setting seed + avoiding index out of bounds for noise array

## Description

Two minor things I encountered when working on my thalamus-aln implementation.

**Seed not set**
Seed given as argument was not set if the constructor called `loadDefaultParams()`
```python
# Before fix:
model = ThalamicMassModel(seed=42)
print(model.params["seed"])  # --> None
```

**Index out of bounds in `noise`**
`noise` has the size `len(t)` whilst `i` goes over `range(startind, startind + len(t))`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0c68752f9b69`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.