# Issue

**Title:** ENH - Replace non-linear orientation optimization in the SAM spinning…

## Description

… case with an equivalent approach based on eigendecomposition

I think that the "spinning" case in ft_inverse_sam.m uses a non-linear optimization algorithm to solve a problem that can equivalently be solved by eigendecomposition. I will explain below why I think this is the case.

I think it might be good to replace the non-linear algorithm with the one based on eigendecomposition for the following reasons.

1.  It is more in line with the remaining cases in ft_inverse_sam.m (i.e. "robert", "gareth", and "moissev"), which are also based on eigendecomposition.
2. In my test case, it produced slightly better results. I followed the fieldrip beamformer tutorial found under https://www.fieldtriptoolbox.org/tutorial/beamformer_lcmv (with "lcmv" replaced by "sam", and after removing the "leadfield" field from the lf datastructure so that the determination of "meansphereorigin" does not fail). Then, the value of the cost function, defined in SAM_costfun.m, was, up to rounding error, consistently smaller in the eigendecomposition-based approach. This makes sense, since the nonlinear algorithm searches for the minimizer up to some tolerance, while the eigendecomposition numerically computes the exact minimizer.
3.  It is more efficient. After replacing the non-linear algorithm with the eigendecomposition-based algorithm, the call to ft_inverse_sam in the above test scenario was sped up by a factor of x1.7 on my machine.

I want to apologize if this is already well-known to the developers, and there is some reason for preferring the non-linear optimization algorithm that I am not aware of. If this is the case, I think it would be nice to add a comment to the code mentioning the equivalent eigendecomposition approach and briefly explaining the reasoning for not using it.

# Equivalence of non-linear approach and eigendecomposition approach
I will now explain why I think these two approaches are equivalent. If this is already well-known, please ignore the following.

In the non-linear approach, the optimization is performed over some angle $\theta$. This angle is only ever used after a call to settan.m, where the first step is computing the vector 

```math
\eta = \begin{pmatrix}\cos(\theta)\\ \sin(\theta) \end{pmatrix}.
```

Hence the optimization is effectively performed over the unit circle in $\mathbb{R}^2$. Furthermore, ft_inverse_sam at the start of the "spinning" orientation optimization computes two vectors $u$ and $v$, which form an orthonormal basis of the corresponding tangential plane. Denoting by $O = (u, v) \in \mathbb{R}^{3 \times 2}$, we see that settan computes $(O \cdot \eta)^\intercal$. Now denote by $n$ the number of sensors, $L \in \mathbb{R}^{n \times 3}$ the leadfield, $C$ the covariance matrix, $N$ the noise covariance matrix, and $C_{\text{inv}}$ the inverse covariance matrix (I am not writing $C^{-1}$ since the "inverse covariance matrix" is computed using ft_inv, and thus e.g. due to regularization might differ from the exact inverse). Taking a close look at SAM_costfun.m, we see that it computes the value

```math
f(\eta) = \sqrt{\frac{\eta^\intercal \cdot O^\intercal \cdot L^\intercal \cdot C_{\text{inv}} \cdot N \cdot C_{\text{inv}} \cdot L \cdot O \cdot \eta}{\eta^\intercal \cdot O^\intercal \cdot L^\intercal \cdot C_{\text{inv}} \cdot C \cdot C_{\text{inv}} \cdot L \cdot O \cdot \eta}}.
```

This function is then minimized using a non-linear optimization algorithm. Now note that since $f$ is a nonnegative function, we have
```math
\arg \min_{\|\eta\| = 1} f(\eta)
=  \arg \min_{\|\eta\| = 1} f^2(\eta)
= \arg \max_{\|\eta\| = 1} \frac{1}{f^2(\eta)}.
```
But if we set $A = O^\intercal \cdot L^\intercal \cdot C_{\text{inv}} \cdot C \cdot C_{\text{inv}} \cdot L \cdot O$ and $B =  O^\intercal \cdot L^\intercal \cdot C_{\text{inv}} \cdot  N \cdot C_{\text{inv}} \cdot L \cdot O$, we have
```math
\arg \max_{\|\eta\| = 1} \frac{1}{f^2(\eta)} = \arg \max_{\|\eta\| = 1} \frac{\eta^\intercal A \eta}{\eta^\intercal B \eta}.
```
But this is now a generalized Rayleigh quotient, which is maximized in an eigenvector corresponding to the largest generalized eigenvalue of the pair $(A, B)$. I refer to Sekihara et. al., Adaptive Spatial Filters for Electromagnetic Brain Imaging, Chapter 13.3, for an argument on why the optimization problem is equivalent to the eigenproblem (or to the Wikipedia article on Rayleigh quotients if one just wants a reference to the statement). It is now exactly this eigenproblem that I implemented in the commit corresponding to this pull request.

Furthermore, I also added the computation of the pseudoZ value for the "spinning" case via the SAM_costfun function. This was primarily done to compare the cost function values of the eigendecomposition-based approach with the cost function values computed using the non-linear optimization approach. Should you consider this code for merging, this function can either be deleted or implemented more efficiently without reference to SAM_costfun.m.

With kind regards
Malte

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6441a1b7f71f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.