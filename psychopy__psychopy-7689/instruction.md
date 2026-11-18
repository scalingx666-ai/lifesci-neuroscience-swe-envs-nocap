# Issue

**Title:** DOC: clarify StairHandler nReversals minimum

## Description

## Summary

 by fixing the documentation, which is the approach @peircej favoured in the issue discussion (*"My instinct here is to fix the docs"*).

The `nReversals` docstring described behaviour that no longer matches the code. It implied the minimum-reversals bump only applies *"if `stepSizes` is a list"*, but `stepSizes` is **always** coerced to a list — a scalar becomes a length-1 list:

```python
try:
    self.stepSizes = list(stepSizes)
except TypeError:           # scalar
    self.stepSizes = [stepSizes]
```

So `nReversals` is always raised to at least the number of step sizes (minimum 1), and `nReversals=0` is never honored. Reproduction on current `dev`:

```python
>>> StairHandler(startVal=0.5, nReversals=0, stepSizes=0.1, nTrials=5).nReversals
1          # not 0 — bumped to len(stepSizes), with a warning
>>> StairHandler(startVal=0.5, nReversals=1, stepSizes=[0.4,0.2,0.1], nTrials=5).nReversals
3          # raised to len(stepSizes)
```

## Changes

- Rewrite the `nReversals` docstring to describe the actual behaviour: it is raised to the number of step sizes when lower (with a warning), defaults to that number when `None`, and — because a scalar step size counts as a single step size — is always at least 1, so `nReversals=0` is not honored.
- Add a regression test (`test_nReversals_clamped_to_nStepSizes`) covering the scalar, list-shorter, list-longer, and `None` cases.

No behaviour change — this documents and pins existing behaviour.

## On the code-change alternative

The issue also raised the option of *allowing* `nReversals=0`. Per @peircej's note about possible knock-on effects (a staircase terminating without ever entering the threshold region), this PR intentionally does **not** change behaviour; it only aligns the docs with the code. Happy to open a separate discussion/PR if enabling `nReversals=0` is wanted.

## Testing

```
python -m pytest psychopy/tests/test_data/test_StairHandlers.py -q   # 55 passed
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4d550dcd63a0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.