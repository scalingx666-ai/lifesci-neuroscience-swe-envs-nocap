# Issue

**Title:** Changed neimode argument to mode

## Description

The use of `neimode` causes.
```
Warning in graph.dfs(x, root = origin, father = TRUE, neimode = "all") :
  Argument `neimode' is deprecated; use `mode' instead
```

Changed to `mode`.

Related to the recent `igraph` update and issue reported here:

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `617ac95458ec`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.