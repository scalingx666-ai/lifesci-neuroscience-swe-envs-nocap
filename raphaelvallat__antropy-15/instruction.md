# Issue

**Title:** modify the _embed function to fit the 2d input

## Description

modify the _embed funciton, so, it can take input as 2d array.
pre store the sliced signal into a list to accelerate concatenation operation.
pre define the indice of sliced signal to reduce the computing in loop.
add vectorized operation in loop to slice the signal for all input signal in one time.

performance:
1e3 signal with 1000 time point, order = 3, decay=1: 0.01s

1e4 signal with 1000 time point, order = 3, decay=1: 0.1s
1e4 signal with 1000 time point, order = 10, decay=1: 0.85s

1e5 signal with 1000 time point, order = 3, decay=1: 1.11s
1e5 signal with 1000 time point, order = 10, decay=1: 9.82s

5e5 signal with 1000 time point, order = 3, decay=1: 67s

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4b2d806d0bc4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.