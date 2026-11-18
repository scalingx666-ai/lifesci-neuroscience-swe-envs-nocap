# Issue

**Title:** Add function to screen neurons in 3D

## Description

So far this is just a straightforward port of `dpscan()` from [flycircuit](https://github.com/jefferis/flycircuit) with the `plot3dfc()` call replaced with the `plot3d()` equivalent. R's lazy-evaluation made this less trivial than expected, but the difference is just:

``` r
pl <- do.call(plot3d, args=list(x=n, col=ifelse(n %in% selected, selected_col, col[i]), flip=flip[i], ...))
```

rather than:

``` r
pl <- plot3dfc(n, col=ifelse(n %in% selected, selected_col, col[i]), flip=flip[i], ...)
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e6316f801d85`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.