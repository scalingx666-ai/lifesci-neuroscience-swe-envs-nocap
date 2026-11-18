# Issue

**Title:** Optimize compute_kda_ma for memory and speed

## Description

- Implement "summary_array" return type for `MKDAKernel`, which convolves kernels to coordinates in a 3D dense volume, summing counts in place, saving substantial memory and compute. 
- Using numba to speed up sphere kernel convolution
- @jdkent set types to int to reduce memory usage
- Minor improvements throughout

For large-scale `MKDAChi2` (i.e. using Neurosynth dataset), memory footprint is reduced ~18-20x (25GB to 1.2GB), and computation is sped up ~3.2x.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `efae75ee7289`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.