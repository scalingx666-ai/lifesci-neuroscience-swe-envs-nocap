# Issue

**Title:** [Fix] z score inplace

## Description

This PR  .

## Changes:

The check for the signal type when using z_score inplace was changed from:
```python
 if inplace and not np.issubdtype(float, sig.dtype): 
```

to:
```python 
if inplace and not np.issubdtype(sig.dtype, np.floating):
```

Additionally a regression unittest was added.

This was originally discovered in the `Elephant_Tutorial_-_LFP_analysis.ipynb` notebook, see also https://tutorials.python-elephant.org .

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2bd871aec145`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.