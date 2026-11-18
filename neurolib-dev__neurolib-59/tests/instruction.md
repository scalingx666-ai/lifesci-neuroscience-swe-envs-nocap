# Issue

**Title:** Fix/bold transformation

## Description

1. Bold transformation with lambda functions now instead of a simple rescaling.

Implemented as

```python
# because this is not a rate model, the input
# to the bold model must be transformed
boldInputTransform = lambda self, x: (x + 1) * 4
```
in each `model.py` file of `hopf`, `fhn`, and `wc` model.

2. Did some clean up of the bold initialization.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ccaf14718883`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.