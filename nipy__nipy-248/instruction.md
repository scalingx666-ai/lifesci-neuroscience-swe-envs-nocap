# Issue

**Title:** Allow object coordinates in CoordinateSystem and CoordinateMap

## Description

This pull request allows us to use objects as coordinate values, as well as Float128.  This makes it possible to use sympy symbols instead of numbers.  Among other things, this also allows the doctests in the documentation to run as expected.

The only bigish change here is that the inverse of an AffineTranform now must be able to conserve the coordinate type, otherwise an AffineTransform returns None as an inverse.  Previously, the inverse of an AffineTransform going from int8 to int8 could return something going from float64 to float64.  Well, it nearly always did.  That's probably wrong so I think this change is a fix, and it didn't break any tests (except a doctest with floating point values returned).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a2489516ac59`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.