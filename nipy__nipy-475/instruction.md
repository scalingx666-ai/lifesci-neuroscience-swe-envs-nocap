# Issue

**Title:** MAINT: update minimum requirements

## Description

Minima as of about October 2017.

Attempt to fix some new failures using Piecewise, which boil down to:

```python
import sympy
t = sympy.symbols('t')
f1 = sympy.Piecewise((0, t <= 0), (1, t < 1), (0, True))
ff = sympy.lambdify('t', f1, "numpy")(0)
```

This gives an error where "iff" is not defined, for Sympy 0.7.0.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0832c7f2e019`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.