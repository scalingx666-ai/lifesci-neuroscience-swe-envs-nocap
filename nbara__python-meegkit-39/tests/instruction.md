# Issue

**Title:** TRCA variation

## Description

Hello, 

In addition to the original method of TRCA, I propose in this PR a variation that use regularization and riemannian mean for the computation of the matrix S (instead of euclidean mean as in original implementation). It provides improvements when data are noisy and have access to large number of calibration data.   

This variation is inspired by a similar work from A. Barachant on CSP: https://hal.archives-ouvertes.fr/hal-00602686/document  

Ideas are :
- Empirical estimator for covariance matrix used in original paper is unbiased but with high variance especially with a high number of channel. It could benefit of some regularization.
- The matrix S in TRCA method represent the average (euclidean) inter-trial covariance matrix. Covariance matrices are semi-definite positive and lie on a riemannian manifold. A measure of distance (geodesic distance) is defined on this curvated manifold: the riemannian mean. Euclidean mean does not respect the curvature of the space.   
However the quality of the estimation of the riemannian mean depends on the number of covariance matrices used.  

It does not provide an improvement of performance for the specific dataset used in ./testd/data/trcadata.mat but we notice at least 10% of improvement on our data that are more noisy and use more calibration data (about 10 trial per class).  

This variation rely on Pyriemann toolbox which is already in requirements.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4aa4ba49354b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.