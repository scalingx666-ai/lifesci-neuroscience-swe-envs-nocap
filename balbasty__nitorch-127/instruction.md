# Issue

**Title:** FIX(affine_tpm): value is the log-likelihood at the final H; soft EM; line search / flexi fixes

## Description

## Summary

Notation, as in the module docstring (with J and K swapped to match the code's axes): 𝒙 ∈ ⟦1,J⟧ᴺ is the discretized image (bins j), 𝒚 ∈ ⟦1,K⟧ᴺ are the hidden TPM classes (k), 𝜇 is the TPM and 𝜙 the affine deformation, so p(𝑦ₙ = 𝑘) = (𝜇 ∘ 𝜙)ₙₖ, and 𝐻ⱼₖ (`prior[..., j, k]`, shape (B, J, K)) links the two.

Part of #114. This PR fixes `nitorch/tools/registration/affine_tpm.py`, which is used by `align_tpm` and `fit_affine_tpm`, and adds tests. The matching `emmi` changes are pushed to #120.

### 1. The value was not the objective (`em_prior`)

The Gauss-Newton gradient and Hessian in `derivatives_intensity` are those of −𝓛, where 𝓛 = ∑ₙ ln ∑ₖ 𝐻{[𝑥ₙ],𝑘} (𝜇 ∘ 𝜙)ₙₖ and H is held fixed. That part was already correct. But `em_prior` returned a different function as its value: ∑ⱼₖ p(𝑥 = 𝑗, 𝑦 = 𝑘) ln 𝐻ⱼₖ, the MI of the expected joint histogram. That is about 𝓛/N plus the mean KL(q ‖ 𝜇 ∘ 𝜙).

- Finite differences of the old value missed the gradient by 0.3–14x, sometimes with the wrong sign.
- The old value is nearly flat within ±1 mm of the optimum.
- So the line search and the stopping test were driven by a function that the GN step does not minimise.

`em_prior` now returns 𝓛 per batch element, evaluated at the final H. This needs one more E-step after the last M-step. Callers still divide by N, and higher is still better, so the line search, the stopping test and the flexi comparison are unchanged. `max_iter=0` now evaluates 𝓛 at the given H.

Checked against finite differences in 𝜇 ∘ 𝜙 (8³, 3 TPM classes, 12 image bins):

| | hard | soft |
|---|---|---|
| H fixed | ~1e-9 | ~1e-9 |
| H re-estimated, no smoothing | ~1e-8 | ~1e-7 |
| H re-estimated, fwhm = 1 | 0.3–4 % | 1–7 % |

With H re-estimated, the remaining error comes from the M-step smoothing: with smoothing, H is not an exact maximiser, so the envelope theorem only holds approximately. The docstring now says so. With these changes, `fit_affine_tpm` gives the same parameters as the `ll` variant from the earlier analysis in all six configurations of the table below.

### 2. Soft (float) images

- **`em_prior` crashed** on soft input. It now runs a proper EM for the expected log-likelihood 𝓛 = ∑ₙⱼ q(𝑥ₙ = 𝑗) ln ∑ₖ 𝐻ⱼₖ (𝜇 ∘ 𝜙)ₙₖ:
  - E-step: q(𝑦ₙ = 𝑘 | 𝑥ₙ = 𝑗) ∝ 𝐻ⱼₖ (𝜇 ∘ 𝜙)ₙₖ, for every bin j
  - M-step: p(𝑥 = 𝑗, 𝑦 = 𝑘) ∝ ∑ₙ q(𝑥ₙ = 𝑗) q(𝑦ₙ = 𝑘 | 𝑥ₙ = 𝑗)
  - The value is 𝓛 at the final H, and the gradient in `derivatives_intensity` is the gradient of that value. This is the same EM as in `emmi` (#120): on the same data the two give the same H to about 1e-12.
- **`derivatives_intensity` had a spurious Hessian term**, `h[:, :K] -= tmp * fixed[:, j]`. With it, dᵀHd was off by about 5x in the test, and the diagonal can become negative (whenever 𝐻ⱼₖ is smaller than the voxel's marginal ∑ₖ 𝐻ⱼₖ (𝜇 ∘ 𝜙)ₙₖ). The term is removed and the loop over image bins is vectorised. The Hessian now matches finite differences to 1e-10.
- A one-hot soft image now gives the same value and the same H as the equivalent hard image.

### 3. `fit_affine_tpm` / `align_tpm`

- **Line search failure:** the parameters were reverted, but the returned `aff` was the matrix of the last rejected trial step. `aff` is now `expm(prm)`.
- **Dead `armijo *= 2`:** it was reset to 1 at the next iteration, so it had no effect. It is removed. Each GN iteration starts with a full step and halves it on failure (up to `max_line_search` = 6 times); successful steps are not enlarged. This is now documented.
- **`flexi=True`** fitted the raw TPM probabilities as if they were prefiltered log-probabilities. For the header-trusted fit, it also used the full-resolution affine on the subsampled data. It now uses `logtpm` and the subsampled `affine_dat1`. Its prints now respect `verbose`.
- **Smaller fixes:**
  - `spline_coeff_nd(..., dim=3)` now uses the TPM's dimension;
  - `get_data`: `x.unsqeeze` (an AttributeError) is replaced by `squeeze(-1)` of a trailing singleton;
  - the weights-file branch tested `x.dim()` instead of `w.dim()`, so it always raised.
- **Gauss-Newton stopping test:** it was a hard-coded `mi - mi0 < 1e-4` on the gain in 𝓛/N. It fired after 4–6 iterations, while more iterations still moved the estimate by 0.1–0.6 mm (see the sweep below). The threshold is now a `tolerance` argument of `fit_affine_tpm` and `align_tpm`, also passed through the progressive fit. The test is on the gain in 𝓛/N, i.e. it stops when the gain in 𝓛 is ≤ `tolerance`·N, and higher is still better. The default is now **1e-6**. The only other caller, `uniseg`, does not expose the affine options, so it uses the new default.
- **EM stopping test:** it also fired when 𝓛 decreased. With smoothing, EM is not monotonic, so a decrease does not mean convergence. EM now stops only on `|Δ𝓛| ≤ tolerance·N` per batch element, or on a non-finite value.

### 4. Documentation

- **Module docstring:**
  - the original symbols are kept (𝒙, 𝒚, 𝜇 ∘ 𝜙, 𝑯, 𝓛, q). J and K are swapped (𝒙 ∈ ⟦1,J⟧ image bins, 𝒚 ∈ ⟦1,K⟧ TPM classes, 𝐻ⱼₖ) to match the code's axes (`prior` is (B, J, K)). A short note maps the symbols to the code variables (`prior`, `fixed`, `moving`, `prm`);
  - H is p(x,y)/(p(x)p(y)) = p(x|y)/p(x), not p(x|y), which shifts 𝓛 by the constant −Σ ln p(xₙ);
  - the histogram is smoothed along the image-bin axis, so the M-step is not exact;
  - the envelope argument holds only approximately;
  - the soft EM;
  - there is no prior on the parameters of 𝜙 (a maximum-likelihood fit).
- **`em_prior`:**
  - the docstring describes what it returns;
  - the garbled log-likelihood comment is replaced;
  - the inverted NOTE (it described the code as returning p(x|y)) is replaced.
- **`derivatives_intensity`:**
  - shapes: `moving` is (1|B, K, *spatial), and the Hessian is packed, with (code) K(K+1)/2 entries for K classes;
  - the returned values are the gradient and Hessian of −𝓛;
  - the incoherent "H[y] − H[x,y]" comment is replaced.
- **`chain_rule`:** shapes.
- **Defaults:** the docstrings now match the code, `max_line_search` = 6 (it said 12) and `spacing` = (8, 4) (it said (8, 3)).

### Accuracy

Synthetic three-class blob TPM, translation (plus rotation for rigid and affine), `fit_affine_tpm(max_iter_gn=40)`. The image is the intensity of the most likely class ("argmax") or of a class sampled from the TPM ("sampled"), plus Gaussian noise σ. The error is the mean displacement error over the field of view, in mm (for translation, the translation error). Each row has 24 configurations: n ∈ {16, 20}, two shifts, three seeds, 32 or 64 bins.

| basis | labels, σ | master | this PR, tol 1e-4 | this PR, tol 1e-6 (default) | default better / worse than master (of 24, by > 0.01 mm) |
|---|---|---|---|---|---|
| translation | argmax, 8 | 0.18 / 0.61 | 0.07 / 0.10 | **0.06 / 0.09** | 23 / 0 |
| translation | argmax, 20 | 0.12 / 0.22 | 0.15 / 0.25 | **0.10 / 0.16** | 11 / 7 |
| translation | sampled, 8 | 0.10 / 0.17 | 0.10 / 0.17 | 0.10 / 0.17 | 0 / 0 |
| translation | sampled, 20 | 0.12 / 0.23 | 0.13 / 0.24 | 0.13 / 0.23 | 0 / 1 |
| rigid | argmax, 8 | 1.21 / 6.33 | 0.42 / 0.68 | **0.28 / 0.65** | 23 / 1 |
| rigid | argmax, 20 | 0.65 / 3.00 | 0.85 / 2.38 | **0.65 / 1.55** | 12 / 8 |
| rigid | sampled, 8 | 0.28 / 1.48 | 0.32 / 1.49 | 0.28 / 1.48 | 1 / 4 |
| rigid | sampled, 20 | 0.83 / 2.13 | 0.86 / 2.05 | 0.82 / 2.13 | 3 / 3 |
| affine | argmax, 8 | 2.16 / 19.1 | 1.79 / 3.65 | **1.58 / 2.00** | 21 / 3 |
| affine | argmax, 20 | 2.06 / 12.1 | 1.66 / 11.0 | 1.66 / 12.4 | 10 / 12 |
| affine | sampled, 8 | 0.69 / 2.23 | 0.69 / 2.24 | 0.64 / 2.15 | 6 / 8 |
| affine | sampled, 20 | 1.76 / 3.82 | 1.66 / 3.49 | **1.38 / 2.84** | 12 / 9 |

Values are median / max over the 24 configurations. The pair from the earlier analysis (24³, 64 bins, argmax, σ = 8) gives, for master / tol 1e-4 / tol 1e-6:
- translation 0.041 / 0.042 / 0.046 mm;
- rigid 1.17 / 0.24 / 0.30 mm;
- affine 4.46 / 1.13 / 1.09 mm.

- **Where the new value matters:** with low noise, where the old value is flattest, the new value clearly helps. Maximum errors drop by 3–10x for all three bases.
- **Sampled labels:** master and this PR take almost the same steps, because every line search succeeds at the first try.
- **The single 12 mm affine outlier** (argmax, σ = 20) is a poor local optimum of 𝓛. A fit run until the line search fails ends at the same place.

#### Choice of the Gauss-Newton tolerance

Each tolerance is compared with a reference fit with `tolerance=0` and `max_iter_gn=200`, which only stops when the line search fails. "Drift" is the mean displacement, in mm, between a fit and the reference: how far the estimate would still move with more iterations. The sweep is the same as above. The whole affine sweep completed (96 configurations). The translation and rigid sweeps stopped at their 5000 s timeout because of the slow reference runs: translation after 44 configurations, rigid after 45 (all with n = 16). The machine was shared during the sweep, so times are only comparable within a column.

| tolerance | translation: drift median / max, GN iterations, time | rigid | affine |
|---|---|---|---|
| 1e-4 (old) | 0.009 / 0.21, 4.2 it, 0.25 s | 0.144 / 0.65, 5.3 it, 0.27 s | 0.205 / 9.1, 6.2 it, 0.30 s |
| 1e-5 | 0.004 / 0.18, 6.4 it, 0.31 s | 0.058 / 0.39, 7.7 it, 0.40 s | 0.089 / 8.3, 8.8 it, 0.39 s |
| **1e-6 (default)** | **0.001 / 0.06, 12.0 it, 0.49 s** | **0.006 / 0.39, 13.4 it, 0.60 s** | **0.029 / 1.4, 13.1 it, 0.57 s** |
| 1e-7 | 0.000 / 0.06, 20.4 it, 0.85 s | 0.001 / 0.10, 21.3 it, 0.90 s | 0.005 / 1.4, 19.0 it, 0.80 s |
| reference (0) | 0, 118 it, 4.3 s | 0, 109 it, 4.0 s | 0, 54 it, 2.5 s |

- **1e-6 is the default:**
  - the median drift falls to 0.001–0.03 mm (from 0.01–0.2 mm at 1e-4);
  - the remaining worst cases (rigid 0.39 mm, affine 1.4 mm) are slow, flat directions, which 1e-7 only partly closes;
  - the runtime is about 2x that of 1e-4 (0.5–0.6 s vs 0.25–0.3 s per fit here).
- **1e-7** roughly halves the median drift again, for about 3x the runtime of 1e-4.
- **1e-5** still leaves about 0.06–0.16 mm of drift on rigid and affine.

## Tests

`nitorch/tests/test_affine_tpm.py` (new, 15 tests; 6 s in total on an idle CPU before the tolerance change, the longest 2 s; on the shared, heavily loaded machine at the end, 67 s for all 15):

- **Value vs gradient, H fixed** (hard and soft): directional finite differences match to 1e-6 relative.
- **Value vs gradient, H re-estimated by EM** (hard and soft): 1e-4 without smoothing; within 20 % with fwhm = 1, the approximation documented above.
- **Hessian vs finite differences of the gradient** (hard and soft, random H): 1e-6, and dᵀHd > 0.
- **Soft EM on a one-hot image** equals the hard EM.
- **Value vs gradient through warp, softmax and chain rule** (affine, 12³): 1e-4.
- **After a forced line-search failure** (`em_prior` monkeypatched to return worse values), the returned `aff` equals `expm(prm)`.
- **`align_tpm(flexi=True)`** (with a spy on `fit_affine_tpm`):
  - every call gets the prefiltered log-TPM, and an affine whose field of view matches the subsampled data;
  - nothing is printed with `verbose=0`.
- **End-to-end translation** (20³, shift (3, −2, 1.5)) is recovered within 0.2 mm, for a hard and a soft image. Master gives 0.61 mm on the hard image and crashes on the soft one.
- **`get_data`** drops a trailing singleton dimension.
- **`tolerance` is honoured:** with 1e-1, Gauss-Newton stops after one iteration; with 1e-7 it runs more (iterations counted by spying on `derivatives_intensity`).
- **`align_tpm` passes `tolerance`** to `fit_affine_tpm`.

**On master, 14 of the 15 tests fail** (the two tolerance tests because the argument does not exist). The hard-image Hessian test passes, because that code is unchanged. The H-fixed tests use `max_iter=0`, which on master returned an uninitialised value.

## Found, not fixed here

- **`flexi=True` is slow** (about 20 s on a 32³ toy: 48 layouts, each with a full fit). It also compares orientations at 2 × `spacing[0]`. On small images this leaves only a few voxels: with 32³ at spacing 4, the comparison runs on 4³ voxels and picked a wrong layout on an image already aligned to the TPM. On real 1 mm images with the defaults this is 16 mm, about 11–12 voxels per axis for a brain.
- **Rotations are weakly determined on near-symmetric blob TPMs.** An image built from the TPM itself gives a 6° rotation (master: 8°). This is a limit of the toy TPM, not of the code, but it is why the rigid and affine errors above stay at about 1 mm. The same flat directions are where the 1e-6 fits still drift by up to 0.4 mm (rigid) and 1.4 mm (affine).
- **No prior on the affine parameters** (documented, not added).

https://claude.ai/code/session_01MHwEa9dAf8MwawzzozKLzE

---
_Generated by [Claude Code](https://claude.ai/code)_

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d42b599f6fd8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.