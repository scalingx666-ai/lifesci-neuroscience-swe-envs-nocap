# Issue

**Title:** Fix slice matrix dimensions in plot.antsImage

## Description

In situations where:

```
winrows <- round(length(slices) / ncolumns) ## rounding down
wincols <- round(length(slices) / winrows)    ## rounding down
```

the product of winrows and wincols can be less than length(slices) causing an error.

Ex:

```
img <- makeImage(c(10,10,10), array(1:1000, dim = c(10,10,10)))
plot.antsImage(img, ncolumns = 4, slice = 1:9)
```

New code honours the user specified ncolumns ```wincols <- ncolumns``` and uses ceiling to compute the number of rows, this ensures sufficient space.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f232df1867b4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.