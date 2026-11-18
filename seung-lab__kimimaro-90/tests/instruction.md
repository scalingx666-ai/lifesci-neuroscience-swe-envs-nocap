# Issue

**Title:** perf: speed up join close components

## Description

only need to compute the upper triangle of this nested loop:

line 110
```
    radii_matrix = np.full( (N, N), np.inf, dtype=np.float32 )
    index_matrix = np.full( (N, N, 2), -1, dtype=np.uint32 )

    for i in range(N):
      for j in range(i + 1, N):  # compute upper triangle only
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ed9c117c1e03`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.