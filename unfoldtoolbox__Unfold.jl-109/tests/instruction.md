# Issue

**Title:** Update splinepredictors.jl

## Description

**Breaking changes:**
- spl(continuous,5) now results in 4 predictors + 1 intercept (e.g. a spline-set with 5 basisfunctions) - this is already the case in matlab.
- Semi-Breaking: The internal structure of splines has been changed greatly (see below), thus saved Unfold files will not be backwards compatible

**Major changes:**
- Switch from BSplines to BSplineKit. Will be better futureproof
- Introduce Circular-Splines (via PeriodicBSplines) using `circspl(colName,10,-π ,π)`
- Added AbstractSplineTerm to facilitate further investigations into splines (and potential penalized splines)

**Minor changes:**
- No anonymous functions for Splines anymore - JLD2 was complaining about this before
- Better `show()` functions for timeexpandedTerms and DesignMat

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7a271f2b3a43`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.