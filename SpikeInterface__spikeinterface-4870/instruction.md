# Issue

**Title:** Fit amplitude scalings with a numba kernel on the normal equations

## Description

`amplitude_scalings` is now 13 times faster on dense Neuropixels data, with the same results.

<img width="1076" height="455" alt="amplitude_scalings_time" src="https://github.com/user-attachments/assets/5c37a670-4107-4b15-be8d-8780dccca5f0" />

*NP 2.0 recording, 519 units and `radius_um=100` sparsity, on an i9-12900K. The 16-job times are from 60 s holding 311,699 spikes; the 1-job times are from 10 s, multiplied by 6.*

On this recording 91 % of spikes collide, so most of the time goes to `fit_collision`. For each collision it builds a design matrix, mostly zeros, and passes it to `scipy.optimize.nnls`. Least squares needs only the matrix's Gram matrix and its product with the waveform. When templates are zero outside their sparsity, each entry of those is a sum over the channels two templates share. The new kernel in `_amplitude_scalings_numba.py` computes those sums, reusing each spike's terms across its collisions, and solves the k × k non-negative fit by Lawson–Hanson. It also fits the spikes that don't collide.

This builds on @JESUSROYETH's #4759, #4764, #4786 and #4797, and reuses the unit overlap matrix from #4797.

The kernel runs when numba is installed and every template is zero outside its sparsity mask. Otherwise, as with an explicit `sparsity` sparser than the templates, the numpy path runs unchanged. The kernel is a plain `@njit`, so `n_jobs` alone sets the parallelism.

The tests compare the two paths spike by spike to `rtol=1e-9`, on synthetic chunks with non-contiguous sparsity, negative amplitudes, a zero template, spikes at both chunk edges, gains of none, float32 and float64, collision handling on and off, and duplicate spikes. A further test runs the whole extension both ways, including the fallback. On 10 s of the real recording, the two paths give identical float32 output.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9ef464e66c1a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.