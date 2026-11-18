# Issue

**Title:** diffusion_mapping.m use symmetric eigenproblem solver

## Description

- Diffusion mapping takes in a symmetric matrix L
- Then does row-normalisation (using row sums in a diagonal matrix D)
- This was previously implemented as D^{-1} L : this created issues as this new matrix is not symmetric, and so the solver returned complex numbers on occassion
- This was fixed in Issue #98 by using D^{-1/2} L D^{-1/2} : this is technically correct but unnecessarily complex
- A much simpler approach is to use the extended functionality of MATLAB's eig function, which can already solve the generalised eigenvalue problem Lv = kDv (where k is eval and v is evec)
- I have implemented this change here. It simplifies the code base. It does not materially change any calculations otherwise.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8730de88ae32`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.