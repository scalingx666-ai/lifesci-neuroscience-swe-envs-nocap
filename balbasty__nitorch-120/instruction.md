# Issue

**Title:** FIX(register): emmi value/soft path, robust IRLS joint objective

## Description

## Summary

Part of #114. This PR covers three loss items: `emmi`, robust losses with an estimated lam, and slicewise MI with Gauss-Newton (investigated only). It also fixes the `@loss emmi` command line. The changes are in `losses/emmi.py`, `losses/robust.py`, four lines of `register/cli.py`, and tests.

### 1. `emmi` (`losses/emmi.py`, `register/cli.py`)

- **The CLI passed a raw image to EMMI** (`cli.py`, 2 lines in each branch). `build_losses` set `loss.mov.soft_quantize`, but nothing reads that attribute. `make_image` reads `discretize` and `soft`, which are passed through `imagekeys` (`Parsed` is a dict, so attributes set on it reach `include()`). So EMMI received the raw single-channel moving image. With a single moving class the value is always 0, the gradient is about 1/mu (up to 6e8), and the translation stayed at (0, 0, 0). The fix sets `loss.mov.discretize = loss.mov.discretize or 16; loss.mov.soft = True`. In the symmetric branch, the swapped option copies now get `optfix.soft, optmov.soft = False, True`.
- **The value and the gradient were for two different functions.** The gradient and Hessian are those of the marginal log-likelihood `L(mu) = -1/N sum_n log sum_k H[x_n,k] mu[n,k]` with H fixed. The value was the MI of the expected joint histogram, `-sum p(j,k) log H[j,k]`. Finite differences of the value disagreed with the gradient, sometimes in sign (e.g. `+2.1e-3` vs `-5.6e-4`). The value is now `L` at the final H, which equals `-MI` when mu is one-hot.
  - With H fixed, value, gradient and Hessian agree to about 1e-6. The Hessian `a aᵀ / N` is exact.
  - With H re-estimated at each call, they agree within the EM tolerance: 1–3% at the default tolerance, about 1e-7 with a tight one.
  - Registration-level check on the 24³ #111 blob pair: the translation gradient matches finite differences within about 1%. The value profile along each axis is now smooth, with its minimum at the true shift. Before, it was jagged with a 1-voxel period.
- **Soft (float) fixed images crashed** with a shape error. The soft path now runs a proper EM for the expected marginal log-likelihood, and its value, gradient and Hessian agree. It is also divided by the number of voxels, like the hard path.
- **Batched inputs crashed**: `add_tiny_` took a max over several dims, and the EM stopping test was not a scalar. This affects slicewise use.
- **The EM stopping test fired on any decrease.** With a smoothed histogram (`fwhm`), EM is not monotonic, so a decrease does not mean it has converged. EM now stops only when `|ΔL| <= tolerance * N`, or when the value is not finite (NaN guard). With an empty mask (N = 0) it stops after the second iteration.
- **The EM tolerance was hard-coded** at `1e-5 * N`. It is now a `tolerance` parameter of `emmi` and `EMMI`, with the same default.
- **Documentation:** the module docstring keeps its original symbols (𝒙, 𝒚, 𝜇 ∘ 𝜙, H, 𝓛, q). J and K are swapped (𝒙 ∈ ⟦1,J⟧ fixed bins, 𝒚 ∈ ⟦1,K⟧ moving classes, 𝐻ⱼₖ) to match the code's axes (`prior` is (..., J, K)), and the function docstrings and comments use the same notation, as in `affine_tpm` (#127). It also explains:
  - H is `p(x,y) / (p(x) p(y)) = p(x|y) / p(x)`, not `p(x|y)`. The extra `1/p(x)` cancels in the E-step and only adds the constant `-Σ ln p(x_n)` to L.
  - the smoothing along the fixed-bin axis;
  - why the gradient with H fixed is only approximately the profile gradient (envelope theorem, with early stopping and smoothing);
  - the soft EM;
  - the sign and scale conventions: `emmi` returns `-L/N` at the final H, with its gradient and Hessian.
- **Consistency with `affine_tpm`** (#127): that PR moves `affine_tpm.em_prior` to the same objective, the same H and the same EM, for both hard and soft images. On random 8³ data with 3 moving classes, 10 fixed bins and fwhm ∈ {0, 1.5}, the two give the same H (max difference about 1e-12, from the `tiny` regularisers). `affine_tpm` returns `+L`, summed over voxels; `emmi` returns `-L/N`. With that factor, the values agree to about 1e-12, and the gradients and Hessians to 1e-13. The two modules share no code; only the 5-line EM stopping test would be shared, and the PRs are separate.

End-to-end check: `register @loss emmi`, translation only, `@@fix -d 32`, on the 24³ pair shifted by (3, -2, 1.5):

| version | recovered translation (mm) |
|---|---|
| master | (0, 0, 0) |
| master `emmi.py` with the moving image soft-quantised | (0.89, -1.69, 0.86) |
| this PR | (2.86, -2.05, 1.44) |

### 2. Robust losses with an estimated lam (`losses/robust.py`)

When lam was estimated, the value was not the objective whose gradient is returned, for three reasons:
- the `-0.5 * sum(w * log lam)` term means the weight update no longer minimises the objective in w;
- the weights came from the previous lam;
- for MAD, `lam = sum w / sum w r²` is dominated by voxels with zero residual. When a few residuals were exactly 0, lam blew up to 4.5e8 and the value to -4e4.

As a result, finite differences of the value missed the gradient by up to 100x for MAD and by 20–100% for Tukey. IRLS now minimises one objective by block updates:

    F(lam, w) = mean[½ lam w r² + φ(w)] - ½ κ Σ log lam
    w   <- reweight(lam)            (exact minimiser in w)
    lam <- κ / mean(w r²)           (exact minimiser in lam)

After the loop, the weights are recomputed for the final lam and the value is F at that point. The returned `lam * w` is consistent with it, so the gradient `mean(lam w r)` is the derivative of the value (envelope theorem).

- **MAD** (κ = 1): the value is the Laplace negative log-likelihood, `mean(√lam |r|) - ½ log lam`, and lam is its maximum-likelihood estimate `1/mean|r|²`. It stays finite when some residuals are zero.
- **Tukey**: ρ is bounded, so κ = 1 is not appropriate. κ = E[w s²] under N(0, 1) (about 0.76 for c = 4.685) makes lam consistent with Gaussian noise. On clean noise it recovers (3.94, 0.253) for a true (4, 0.25).
- **Tukey's value** used MAD's dual term `1/(2w)`. It is now `c²/6 (1 - 3w + 2w^{3/2})`, so the fixed-lam value equals Tukey's ρ (`c²/6` for |s| ≥ c).
  - **Relation to #103:** the #103 body describes a Tukey-specific dual. That commit (`057b408`, "exact Tukey loss value via per-loss IRLS dual term") was pushed to `claude/bugfix/register-robust-losses` after #103 had already been merged at `7e04484`, so it never reached master. This PR supersedes it: the same dual, plus the estimated-lam objective.

IRLS converges in 17–37 reweights on the test cases (capped at 64; it stops when |Δ log lam| < 1e-6).

### 3. Slicewise MI with Gauss-Newton (investigated, `mi.py` not changed)

Setup: 24³ blob pair, translation, MI with `norm=None`, spline 1, at two points 0.6–0.9 mm from the optimum. The ratio is `dᵀHd` from the GN Hessian over the finite-difference curvature along d = g/|g|:

| histogram | bins | GN / FD curvature | GN step along -g vs best step |
|---|---|---|---|
| volume | 32 (CLI default) | 1.2, 9.0 | 1.86 vs 0.60 mm, 1.47 vs 0.75 mm |
| slicewise (z) | 32 (CLI default) | **15, 55** | **0.28 vs 0.50 mm, 0.17 vs 0.60 mm** |
| volume | auto (16) | 0.083, 0.093 | 12.7 vs 0.75 mm |
| slicewise | auto (8) | 0.087, 0.076 | 7.2 vs 0.55 mm |

The diagonal GN Hessian leaves out how voxels are coupled through the histogram. Its scale relative to the true curvature grows roughly like bins⁴ / voxels: about ×16 from 16 to 32 bins, and about ×256 from 8 to 32 bins.

- With the CLI default of 32 bins, a 576-voxel slice has about 0.6 voxels per bin. The GN Hessian is then 15–55x too large and the steps 2–3.5x too short, which is the slow convergence reported in #102.
- With per-slice auto bins, the GN Hessian is about 12x too small (as for the whole volume), and the line search has to backtrack.

There is no normalisation bug in `mi.py`. Recommendations:
1. Size the histogram per slice for slicewise losses: `autobins` on the slice, or the requested bins scaled by (nvox_slice / nvox_volume)^¼.
2. Make the optimiser tolerate a mis-scaled Hessian: a line search that can lengthen steps, or a secant rescaling of H.
3. Optionally, correct the diagonal GN by the number of voxels per occupied bin in `core/_hist.py`.

## Allocations

A follow-up commit (`c565198`) reduces the allocations in the code this PR adds to `emmi.py` and `robust.py`. It uses the idioms of the older loss code: in-place ops, `out=` buffers reused across iterations, and contractions instead of large temporaries.
- **`emmi` hard:** the final objective reuses the EM buffers (`z`, `norm`). The log is taken in place once the gradient no longer needs `norm`.
- **`emmi` soft:** `norm` and the responsibilities live in two (J, N) buffers. Both are reused across EM iterations and by the derivatives. The packed Hessian is now a single `matmul` with `sym_outer(H)`. Before, it took K(K+1)/2 matmuls into a zeroed buffer.
- **`add_tiny_`** computes `max |x|` without the `|x|` temporary.
- **Native-dtype sums** (commit `0ee29e3`, pushed just after this PR was merged, so it is carried by #134 as `b7bf3d0`): the log-likelihood and the value are summed in the input dtype, and only the reduced scalar is cast to double (for the EM convergence ratio and the returned value). Before, `sum(dtype=double)` cast the whole float32 (J, N) tensor to double first: 512 MB at 64³ with J = 256. An intermediate chunked `sum_double` helper is gone. float32 CPU sums are pairwise, so the value moves by ~1e-7 relative at most; float64 is unchanged.
- **Robust losses with an estimated lam:** r² is computed once, and each reweighting runs in place on s² = lam r² in reused buffers. So there is no residual, weight or product tensor per iteration. The dual term and `lam * w` reuse buffers that are free by then. The fixed-lam path is unchanged: Tukey with a fixed lam is the only path that autograd can differentiate (before and after), and it still can.
- **The outputs are unchanged:**
  - bitwise for `emmi` hard, for `emmi` soft in float64, and for MAD/Tukey with a fixed lam;
  - with an estimated lam, within 5e-15 in float64 and 3e-7 in float32 (1.5e-6 with soft masks, on a value with cancellation);
  - `emmi` soft in float32: within 3e-7.

  This was checked on 1152 configurations: hard/soft, K, J, masks (binary or soft), batched input, fwhm, max_iter, fixed/estimated/cached lam, joint, zero residuals, and dtype. `test_register_loss_alloc.py` pins the reference outputs of the previous implementation and checks that no input is modified.

float32, `loss_grad_hess`, EMMI with `max_iter=32`. Peak memory is measured with `torch.profiler` (`profile_memory=True`) and includes the outputs. Time is the minimum of 5 interleaved runs on 1 thread (the machine was shared).

| case | peak MB, before → after | allocations ≥ 1 MB (count, total MB), before → after | time (s), before → after |
|---|---|---|---|
| EMMI hard 96³ K=3 J=32 | 54 → 47 | 30, 162 → 21, 118 | 0.11 → 0.10 |
| EMMI hard 96³ K=16 J=256 | 581 → 530 | 180, 1428 → 111, 1094 | 3.50 → 3.46 |
| EMMI soft 64³ K=3 J=32 | 194 → 107 | 38, 829 → 17, 183 | 0.57 → 0.26 |
| EMMI soft 96³ K=3 J=32 | 655 → 361 | 42, 2808 → 21, 628 | 1.99 → 1.02 |
| EMMI soft 64³ K=16 J=256 | 1538 → 922 | 159, 6731 → 21, 1475 | 6.98 → 2.76 |
| MAD, estimated lam, 96³ 1 channel + mask | 16 → 14 | 48, 162 → 7, 24 | 0.13 → 0.09 |
| MAD, estimated lam, 96³ 3 channels | 48 → 41 | 51, 494 → 7, 71 | 0.21 → 0.12 |
| Tukey, estimated lam, 96³ 1 channel + mask | 17 → 14 | 36, 122 → 8, 27 | 0.07 → 0.04 |
| Tukey, estimated lam, 96³ 3 channels | 51 → 41 | 43, 359 → 8, 81 | 0.16 → 0.07 |

The hard path's peak is now its outputs (g, h) plus one (K, N) buffer. The soft path's peak is three (J, N) buffers plus h. The EMMI soft "after" peaks and allocation counts are re-measured after `0ee29e3` (peak from the `torch.profiler` memory timeline). With the chunked helper (`c565198`) the same measurement gave peaks of 115 / 369 / 930 MB, and 201 / 642 / 1365 allocations of at least 1 MB (its 8 MB chunks, every EM iteration). Their times are not comparable with the column above, since this machine is slower: with 1 thread, `c565198` → `0ee29e3` took 0.84 → 0.71 s, 3.52 → 2.97 s and 9.61 → 8.32 s.

## Tests

- `nitorch/tests/test_register_emmi.py` (new, 12 tests):
  - exact gradient and Hessian with H fixed (hard and soft fixed image);
  - value finite differences vs gradient with H re-estimated (hard and soft);
  - a one-hot moving image gives `-MI`;
  - the EM stopping test: no stop on a decrease, a stop on a small change or NaN;
  - the `tolerance` parameter of `emmi` and `EMMI` (hard and soft);
  - batched input;
  - the CLI passes a 16-channel soft-quantised moving image and a discretised fixed image to EMMI, with and without `--symmetric`;
  - `register @loss emmi` recovers the (3, -2, 1.5) shift on a 24³ pair within 0.5 mm (about 7–20 s). It is marked `@pytest.mark.slow`, now that the marker is on master, so it runs only with `--runslow`.
- `nitorch/tests/test_register_robust.py` (+20 tests):
  - estimated-lam finite differences vs gradient (MAD/Tukey × joint × with/without zero residuals);
  - the value equals the fixed-lam value at the final lam plus the log term, and the weights match the final lam;
  - IRLS convergence;
  - MAD lam equals the Laplace ML estimate when some residuals are zero;
  - Tukey lam matches the noise precision on Gaussian noise;
  - the fixed-lam Tukey value equals ρ.
- **Before the fixes, 22 of the new tests fail:** 19 with master's `losses/`, and the 3 CLI tests with master's `cli.py`. The IRLS convergence test is a regression check and passes on master too.
- `nitorch/tests/test_register_loss_alloc.py` (new, 49 tests):
  - value, gradient, Hessian and final H/lam match the reference outputs of the previous implementation (hard/soft EMMI, MAD/Tukey with a fixed, estimated and cached lam, masks, joint, batched input, float32);
  - `loss`, `loss_grad` and `loss_grad_hess` leave `moving`, `fixed`, the mask and the cached prior/lam unchanged.
- **After the allocation commit:** `test_register_emmi`, `test_register_robust`, `test_register_mi`, `test_register_parser` and `test_register_loss_alloc`, with `--runslow`, give **116 passed**.
- **After the native-dtype sums commit** (`0ee29e3`, after merging the latest master): the same five files with `--runslow` give **116 passed**. No reference output in `test_register_loss_alloc.py` had to change.
- **With this PR** (after merging the latest master): `test_register_robust`, `test_register_emmi`, `test_register_mi`, `test_register_parser`, `test_register_gmm` and `test_register_symmetric` give **98 passed, 2 skipped** (the skipped ones are slow). `test_register_emmi` and `test_register_robust` with `--runslow` give **40 passed**.

## Found, not fixed here

- **The default of 256 fixed bins for `emmi` is too fine on coarse pyramid levels.** At 12³ (1728 voxels for 256×16 entries of H), H overfits. The cached H also changes the value of a given transform from call to call, so the GN stopping test can fire early. A plain GN loop at 12³ reaches about (3.36, -1.94, 1.97). A smaller default, or one that scales with the number of voxels, would help.
- **On small pairs the optimum itself is off.** With 16³–20³ pairs, or 8 moving bins, the EMMI optimum is 0.4–0.9 mm short in x. It is a stationary point: the same result with `-n 200 -t 1e-9`. This is likely due to the field-of-view and mask edges, and is why the end-to-end test uses 24³ and 32 fixed bins.
- **Slicewise MI returns NaN when a slice is constant**, e.g. a moving slice warped fully outside the field of view, with or without a mask. `JointHistCount` divides by `max - min = 0` (`core/_hist.py`). A guard is needed there, or `mi.py` should pass guarded `min`/`max`.
- **Slicewise MI with spline ≥ 2** still fails in TorchScript `nd.push` on batched grids (already listed in #114).
- **Tukey with `joint=True`:** κ is computed for a 1-D standardised residual. With K channels the lam estimate is biased (7.0 vs about 4.5 non-joint on a 2-channel case). Value and gradient are still consistent.
- **The IRLS print in `pairwise_impl`** calls `irls(...)` without reweight parameters. `irls` now falls back to `self.c`, but the call still runs a full IRLS only to display lam.

https://claude.ai/code/session_01MHwEa9dAf8MwawzzozKLzE

---
_Generated by [Claude Code](https://claude.ai/code)_

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1864854e1025`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.