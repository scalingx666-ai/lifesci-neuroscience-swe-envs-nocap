# Issue

**Title:** FIX(affine_tpm): flexi compares orientations at the coarsest level with enough voxels per parameter

## Description

## Summary

Part of #114 (the `flexi` item). The slowness of `flexi` is not addressed here.

Notation as in the module docstring: 𝒙 ∈ ⟦1,J⟧ᴺ is the discretized image (J bins), 𝒚 ∈ ⟦1,K⟧ᴺ are the hidden TPM classes, 𝜇 ∘ 𝜙 is the deformed TPM, 𝐻ⱼₖ is the normalized joint histogram, and 𝓛 = ∑ₙ ln ∑ₖ 𝐻{[𝑥ₙ],𝑘} (𝜇 ∘ 𝜙)ₙₖ.

`align_tpm(flexi=True)` fits the header orientation and the 48 axis permutations and flips (3D), and keeps the one with the largest 𝓛/N. These fits used to run at `2 * spacing[0]`.

### Rule

The candidates are now fitted and compared at the **coarsest level of `spacing`** whose (weighted, in-mask) number of voxels is

  N ≥ c (F + J K)

That is, at least c voxels per estimated parameter:
- F parameters of 𝜙 (12 for `'affine'` in 3D);
- J × K entries of 𝑯 (J = `bins`, K TPM classes).

If no level qualifies, the finest level is used. Details:
- c is the new option `align_tpm(..., samples_per_param=8)`.
- The level is chosen by the pure function `flexi_level(nb_vox, nb_bins, nb_classes, nb_prm, samples_per_param)`.
- This only chooses where orientations are compared. The selected orientation is then fitted on `spacing` as before, even when the comparison level is finer than `spacing[0]`.
- With `verbose`, the chosen spacing and N are printed.

**Why c = 8.** The table below starts a fit at the true transform at each level and shows how far it drifts. The transition lies between 2.5 voxels per parameter (4.0 mm off) and 20 (1.0 mm). A power of two inside that range is 8. J·K overcounts the effective freedom of 𝑯, because 𝑯 is smoothed along j (fwhm = J/64): with 256 bins, 16³ is only 5.3 voxels per parameter and already gives 1.0 mm. So c = 8 errs on the safe side.

**Real images.** At the default `spacing=(8, 4)` and `bins=256`, with SPM's TPM (K = 6, so c(F + JK) ≈ 12.4k), a 1 mm 256 × 256 × 180 image has about 23.6k voxels at 8 mm and 3.1k at 16 mm. So `flexi` compares at 8 mm.

### Diagnosis

I checked each possible cause:

- **Objective and normalisation: consistent.** The header fit and every candidate fit return 𝓛/N, with 𝑯 re-estimated by EM, on the same subsampled data and weights. So N is the same for all, and so is the constant −∑ₙ ln p(𝑥 = 𝑥ₙ). All values come from the same stage, the last accepted Gauss-Newton step.
- **Bookkeeping: correct.** `prm0` / `reorient0` / `mi0` are updated together. The final fit starts from `prm0`, with `reorient0` applied to the data affine at every level, and the returned matrix is `aff @ reorient0`.
- **Candidate set: complete.** It has the 48 signed permutations plus the header.
- **Resolution: this is the cause.** With too few voxels per parameter, 𝜙 and 𝑯 overfit, and the maximum of 𝓛/N is far from the truth. A wrong orientation then scores higher than the right one.

The toy is 32³ with 1 mm voxels and a three-class TPM, with no symmetry that an affine can undo (an ellipsoid with three off-centre inner blobs of different sizes). The image is the TPM's most likely class plus noise, σ = 8, affine basis. Fits are started at the true transform:

| bins | sampling | voxels | voxels / parameter | 𝓛/N at truth → after fit | drift from truth |
|---|---|---|---|---|---|
| 256 | 8 mm | 4³ | 0.08 | 0.399 → 0.428 | 22.9 mm |
| 256 | 4 mm | 8³ | 0.66 | 0.381 → 0.396 | 4.1 mm |
| 256 | 2 mm | 16³ | 5.3 | 0.382 → 0.391 | 1.0 mm |
| 256 | 1 mm | 32³ | 42 | 0.380 → 0.390 | 1.0 mm |
| 64 | 8 mm | 4³ | 0.31 | 0.400 → 0.442 | 5.5 mm |
| 64 | 4 mm | 8³ | 2.5 | 0.378 → 0.394 | 4.0 mm |
| 64 | 2 mm | 16³ | 20 | 0.381 → 0.391 | 1.0 mm |
| 64 | 1 mm | 32³ | 161 | 0.380 → 0.390 | 1.0 mm |

Rescoring coarse fits at a finer level does not help, because the coarse parameters are already wrong. The candidates have to be fitted where 𝓛/N is informative.

The blob TPM of the existing tests (and of #127) is nearly symmetric under affine maps. On it, wrong orientations score within about 0.02 of the right one at 4³ and 8³, so that toy cannot validate the search.

### End to end

Same toy. The image voxel axes are permuted and/or flipped relative to the TPM, and both headers are the identity. Mean displacement error (mm), seeds 0 / 1 / 2, single thread:

| setting | compared at | permutation + flip | 90° rotation | flip | wrong |
|---|---|---|---|---|---|
| `spacing=2`, 256 bins, master (2·spacing[0]) | 8³ | 1.25 / **16.3** / **21.5** | 1.21 / **16.1** / **16.1** | 1.21 / **16.1** / **16.1** | 6/9 |
| `spacing=2`, 256 bins, this PR (no level qualifies → finest) | 16³ | 1.25 / 1.20 / 1.21 | 1.20 / 1.10 / 1.13 | 1.20 / 1.10 / 1.13 | 0/9 |
| `spacing=(4, 2)`, 64 bins, at spacing[0] (`samples_per_param=0`) | 8³ | 1.26 / **16.5** / 1.21 | **16.2** / **16.1** / 1.13 | **16.2** / **16.1** / 1.13 | 5/9 |
| `spacing=(4, 2)`, 64 bins, this PR (c = 8) | 16³ | 1.26 / 1.20 / 1.21 | 1.17 / 1.09 / 1.13 | 1.17 / 1.09 / 1.13 | 0/9 |

An aligned image (run only with `spacing=2`) is recovered to 1.0 mm by both master and this PR. ~1.1–1.3 mm is the floor: a fit started at the truth ends 1.0 mm off. An `align_tpm` call took 19–26 s with c = 8 and 28–41 s when comparing at 8³.

## Tests

`nitorch/tests/test_affine_tpm.py`:

- **`test_flexi_level`** (new, pure function). The coarsest qualifying level is chosen. A level with N = c(F + JK) exactly qualifies. The finest level is the fallback. The order of the levels does not matter. c = 0 gives the coarsest level.
- **`test_flexi_compares_at_chosen_level`** (new; `fit_affine_tpm` is spied). The 49 candidate fits run at the chosen level: 16³ with 64 bins, 8³ with 16 bins, for `spacing=(4, 2)`. The final fit still runs at 8³ then 16³. It takes 3 s.
- **`test_flexi_recovers_orientation`** (slow, parametrized, `make_chiral_tpm` helper). Permutation + flip, seed 1. It checks the comparison level and requires a final error < 2 mm:
  - `spacing=2`, 256 bins, fallback to 16³: 1.20 mm (16.3 mm on master), 23 s;
  - `spacing=(4, 2)`, 64 bins, rule picks 16³: 1.20 mm (16.5 mm when comparing at spacing[0]), 21 s.
- `test_flexi_uses_logtpm_and_subsampled_affine` still passes.
- `OMP_NUM_THREADS=1 pytest nitorch/tests/test_affine_tpm.py --runslow`: 19 passed in 57 s. Without `--runslow`: 17 passed, 2 skipped, 10 s.

https://claude.ai/code/session_01MHwEa9dAf8MwawzzozKLzE

---
_Generated by [Claude Code](https://claude.ai/code)_

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c415c7dc73cc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.