# Issue

**Title:** Fix MATLAB diffusion_mapping: complex eigenvalues (#98) and sqrt(N) component cap

## Description

. Addresses #94 (the n_components cap noted by @ReinderVosDeWael and @annchenknodt).

## Summary
**Bug 1 — complex eigenvalues (#98).** The Markov matrix `M = D^{-1} L` constructed in `diffusion_mapping.m` is asymmetric, so `eig(M)` can return tiny imaginary parts and an unsorted spectrum, which breaks `sort(eigval, 'descend')`. The user @tw70455 traced this exactly: the MATLAB path normalizes by row only, while the Python path keeps the formulation symmetric.

Fix: solve the eigenproblem on the symmetric similar matrix
\$\$M_s = D^{-1/2} L D^{-1/2}\$\$
which has the same real eigenvalues as \$M\$. Eigenvectors map back via \$\\psi = D^{-1/2} u\$. This is mathematically equivalent to the previous formulation but numerically stable, and matches the Python implementation.

**Bug 2 — silent component cap (#94).** The previous code did `n = max(2, floor(sqrt(N)))` and then truncated `eigval(1:n)` regardless of the user-requested `n_components`. That's why @annchenknodt got a max of 17 components on a 360×360 matrix (`sqrt(360) ≈ 18.97`, minus the dropped first eigenvalue). The maintainer noted he didn't remember why this cap was there. Removed it; the function now honors `n_components` and warns only when it genuinely exceeds the matrix size.

## Test plan
- [ ] Maintainer runs MATLAB CI / existing tests to confirm no regression.
- [ ] Confirm with @tw70455's input (cosine similarity matrix, alpha=0.5, diffusion_time=0) that eigenvalues are real and properly sorted.
- [ ] Confirm @annchenknodt can request >sqrt(N) components on a 360×360 matrix without the cap kicking in.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d1c514a9a466`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.