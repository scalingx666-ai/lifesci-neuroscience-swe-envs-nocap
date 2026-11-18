# Issue

**Title:** Plot basic network opts

## Description

[Second try, checks look OK on my machine now]

Adding more functionality for plotBasicNetwork:

Support binary edge weights

Display nodes only, if no edges supplied (previously did this but with an error)

Allow edge color to be determined by a heat map, a user defined function, a custom list or constant color

Node radius scaled by strength (degree in unweighted case) with minimum and maximum radii

Optionally quantile transform weights (as before) or clip edges to specified quantiles

Set background color

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bde870410e31`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.