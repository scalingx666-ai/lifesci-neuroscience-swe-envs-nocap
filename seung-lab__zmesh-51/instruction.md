# Issue

**Title:** perf: exploit accumulation of bits to avoid last round

## Description

Uses two tricks:

1) accumulate `c` into a second bitfield progressively so that we can avoid recomputing c on the last iteration
2) detects the last iteration by checking accumulate for 0xff and for matching the final label

NEW:

ZMESH
marching cubes (blank): 0.298s, 450.09 MVx/sec, N=1
marching cubes (filled): 0.329s, 407.40 MVx/sec, N=1
marching cubes (connectomics.npy): 4.127s, 97.40 MVx/sec, N=3
marching cubes (random): 6.802s, 13.08 MVx/sec, N=1

OLD:

ZMESH
marching cubes (blank): 0.440s, 304.34 MVx/sec, N=1
marching cubes (filled): 0.401s, 333.88 MVx/sec, N=1
marching cubes (connectomics.npy): 4.488s, 89.56 MVx/sec, N=3
marching cubes (random): 9.136s, 9.74 MVx/sec, N=1

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `29591623a8bd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.