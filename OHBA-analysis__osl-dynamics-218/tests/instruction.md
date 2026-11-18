# Issue

**Title:** Add SC-DyNeMo to models.

## Description

Adds `DampedOscillatorCovarianceMatricesLayer` and a model for single-channel DyNeMo on time-embedded data.

The model is defined by the auto-correlation function of each mode, given by:

$$
R_j (\tau) = A_j e^{- \lambda_j \tau}\cos(2 \pi f_j \tau)
$$

where,

- $\lambda_j$ is the damping factor
- $f_j$ is the frequency of the oscillator
- $A_j$ is the amplitude

for the $j$-th mode.

The ACFs form the first row of a symmetric Toeplitz matrix:

$$
        \Sigma_j = \begin{bmatrix}
            R_j(0) & R_j(1) & \dots & R_j(p-1) \\
            R_j(1) & R_j(0) & \dots & R_j(p-2) \\
            \vdots & \vdots & \ddots & \vdots \\
            R_j(p-1) & R_j(p-2) & \dots & R_j(0)
        \end{bmatrix}
$$

where $p$ is the embedding dimension.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a33db8340e52`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.