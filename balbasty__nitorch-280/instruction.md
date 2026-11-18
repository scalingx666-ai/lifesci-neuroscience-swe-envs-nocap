# Issue

**Title:** FEAT(register): fit the affine on a random subset of voxels (@affine --samples)

## Description

## Summary
Opt-in voxel sampling for affine-only fits, from #156: `@affine --samples N` in the CLI, or `AffineModel(samples=N)`.

**What gets sampled.** The data terms of affine-only fits are evaluated on N voxels of each fixed image instead of all of them. Affine-only fits are the progressive initialisation and the affine stage before any `@nonlin`. The default is all voxels, so nothing changes unless the option is used.

**Values of N:**
- `all` or `inf` (or `0`): all voxels, the default.
- A count. It can be written `262144`, `2^18`, `64^3`, `256k`, `1M` or `1e5` (`objects.parse_samples`).
  - It is a number of voxels, not a per-dimension count, because the sampling error depends on N alone (it decreases as 1/√N). `64^3` covers the per-dimension intuition.
  - For multi-channel images, a sample is a voxel, and every channel is read at that voxel.
- `auto`: `max(2^16, 2^14 × parameters, 256 × joint-histogram cells)` (`objects.auto_samples`).
  - Losses report their joint histogram through `OptimizationLoss.histogram_cells`: MI/NMI/entropy their bins, EMMI its fixed labels × moving channels, pointwise losses none.
  - With the default 32×32 bins, NMI gets 2¹⁸ samples, the value that works on the real data below.
  - Pointwise losses get about 10⁵ samples for rigid and 2×10⁵ for affine.
  - The constants were calibrated on a few pairs, so this is a heuristic.

**Design:**
- **A fixed subset, drawn once per pyramid level with a fixed seed.** Voxels are drawn uniformly, without replacement, among the fixed image's voxels (those in its mask, if any). The objective therefore stays a deterministic function of the parameters, as Gauss-Newton and the line searches require, and runs are reproducible. Coarse levels with fewer voxels than N use all of them.
- **Horvitz-Thompson weights.** Each sampled voxel is weighted by the inverse of its probability of being drawn, through the loss mask.
  - Sums over the subset are unbiased estimates of sums over the image.
  - Normalised losses (MI, averaged MSE) are unchanged.
  - So the data terms keep their scale with respect to the affine prior.
- **Any loss that only depends on the set of voxel values works unchanged.** The samples are laid out as an (N, 1, 1) image.
  - Losses that depend on the spatial arrangement of the voxels (LCC, LGMM, slice-wise losses) always use all voxels, with a warning. They are flagged by a new `OptimizationLoss.spatial` attribute.
  - Histogram losses with automatic bins (`bins=None`) get the bins of the whole image, not those of the samples (`resolved_bins`).
- The live plot (`-v 3`) still shows the whole image.

Nonlinear fits on a coarse field would need stratified rather than uniform sampling: #282.

## Real data
Midnight Scan Club (ds000224), 0.8 mm, 224×256×256, C backend. Each fit is compared with the best full-voxel solution found in the early-stopping evaluation (#266):
- **distance**: RMS displacement over the fixed mask, in fixed voxels;
- **NMI**: the full-voxel objective at the final transform.

With the stopping rule proposed in #266 (`-t 0 -d 1e-2`):

| pair | voxels | time (s) | distance (vox) | full-voxel objective |
|---|---|---|---|---|
| T1↔T1 rigid, MSE | all | 28.9 | 0 | |
| | 2²⁰ | 34.3 | 0.010 | |
| | 2¹⁸ | 31.3 | 0.021 | |
| | 2¹⁶ | 14.0 | 0.066 | |
| T2→T1 rigid, NMI | all | **1009** | 0.19 | 0.86603 |
| | 2²⁰ | 59 | 0.28 | 0.86603 |
| | 2¹⁸ | **22** | 0.28 | 0.86612 |
| | `auto` (= 2¹⁸) | 27 | 0.31 | |
| | 2¹⁶ | 15 | 0.40 | 0.86598 |
| between subjects, affine, NMI | all | 142 | 0 | 0.87938 |
| | 2²⁰ | 68 | 1.04 | 0.87984 |
| | 2¹⁸ | 29 | 1.46 | 0.88013 |
| | 2¹⁶ | 13 | 0.50 | 0.87936 |

Times are total CLI times, including loading and the pyramid.

How to read it:
- **T2→T1 rigid NMI, the expensive case.** It is 37–45× faster with 2¹⁸ samples, and lands in the same basin as the full-voxel fit:
  - full-voxel NMI 0.86598–0.86612, against 0.86603 for the full fit;
  - the full-voxel fits with tighter tolerances span 0.13–0.19 voxel.
- **Between subjects (12 parameters).** The sampled solutions differ by 0.5–1.5 voxels, but their full-voxel NMI (0.87936–0.88013) is within the range of the full-voxel fits (0.87938–0.88053). The landscape is flat there, and 2¹⁶ samples found the lowest NMI of all.
- **MSE.** Sampling is accurate to 0.02 voxel with 2¹⁸ samples.

With the current default stopping rule, sampled fits are 4–12× faster and land as close to the full-voxel fit as the full-voxel fits are to each other. The default stops too early on T2→T1 whether sampled or not (#266).

## Tests
`nitorch/tests/test_register_affine_samples.py`:
- sample layout: coordinates, values, distinct voxels inside the mask;
- unbiased weighted sums;
- gradients of the sampled objective (finite differences) for MSE and MI;
- the same sample at every evaluation and across runs;
- the sampled loss has the scale of the full loss;
- all voxels are used when N exceeds the image, and for spatial losses (with a warning);
- recovery of a known rigid transform;
- parsing of N (`2^18`, `64^3`, `256k`, `1e5`, `all`, `inf`, `auto`, invalid values);
- the `auto` rule, and what it counts for each loss;
- automatic bins come from the whole image.

Also parser tests for `--samples`.

Registration and CLI tests (TS): 1214 passed, 33 skipped.

Part of #156.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_014dBjaUGFKHtAQeNPPDHTHh

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a07ff2bb8a4f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.