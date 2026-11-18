# Issue

**Title:** Use column-major storage for sparse Matrix factorization

## Description

Sparse `Matrix.solv` can return a vector that does not solve the system. For `A = 4I` with `A[1,0] = -2` and `b = 1`, the solution is `[0.25, 0.375, 0.25, 0.25, 0.25]`: row 0 gives `x0 = 0.25`, and row 1 gives `(1 + 0.5) / 4`. 9.0.2 and current master return five copies of 0.25, which leaves a residual of 0.5 in row 1, with no error. 8.2.7 and a full `Matrix` holding the same values return the right answer.

`OcSparseMatrix` stores entries by row and has used that type for `SparseLU` since #2470. The example above has an asymmetric sparsity pattern. This keeps the public storage as it is and factors a compressed column-major copy. LU reuse is unchanged.

`test/pytest/test_matrix_sparse_solve.py` checks a lower and an upper off-diagonal entry, the residual, that the source matrix is unchanged, and reuse with a second right-hand side.

On Ubuntu 24.04 with gcc 13.3 and Python 3.12, built like CI with CoreNEURON, MPI and RX3D on and InterViews off, the full `ctest` run passed 524 of 524 tests and the new test passed. With the production files at the base and the new test kept, the test fails with an `AssertionError`.

Prepared with AI assistance (Claude Code and OpenAI Codex).

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01JfvcPZyKcKQUG9fQGYfRMw

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `408cc5466c36`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.