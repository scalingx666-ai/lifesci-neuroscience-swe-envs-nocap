# Issue

**Title:** BF: avoid relying on Pythonic casting of bool into numeric for sympy expressions

## Description

sympy 1.6 introduced breaking change (see
https://github.com/sympy/sympy/wiki/Release-Notes-for-1.6 for full log):

    Relational is no longer a subclass of Expr and does not produce nonsensical
    results in arithmetic operations. This affects all Relational subclasses (Eq,
    Ne, Gt, Ge, Lt, Le). It is no longer possible to call meaningless Expr methods
    like as_coeff_Mul on Relational instances. (#18053 by @oscarbenjamin)

which broke all Pythonish expressions like `(x > 0) * (x < 1)` to define a square
wave.  Thanks to guidance from @oscarbenjamin in
 I RFed all such uses to use
sympy.Piecewise instead to make it more explicit.

While at it, I also adjusted comments claiming intervals like `[0, 1]` (which
includes the endpoints), whenever in reality they were `(0, 1)` (endpoints not
included).

This is  AFAIK

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a2e0e06f5b60`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.