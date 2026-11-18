# Issue

**Title:** FIX(register): joint Tukey — κ(C) and scaled c(C); verbose lam display without IRLS

## Description

## Summary

Part of #114. Two items: Tukey with `joint=True`, and the verbose print in `pairwise_impl`. Changes are in `losses/robust.py`, the three display sites in `pairwise_impl.py`, and tests.

### 1a. κ as a function of the number of channels (`losses/robust.py`)

**#120's definition (C = 1).** With s² = lam·r², IRLS minimises
`F(lam, w) = mean[½ lam w r² + φ(w)] − ½ κ Σₖ log lamₖ`. The lam update is `lamₖ = κ / mean(w rₖ²)`, so lam solves `mean(w sₖ²) = κ`. With κ = E[w(s) s²] for s ~ N(0, 1), the true precision is a fixed point under Gaussian noise. For c = 4.685, κ = 0.7578 (`_tukey_kappa`, a trapezoid integral).

**Joint case.** The weights are `w = w(S²)` with `S² = Σₖ sₖ²`. At the true precision S² ~ χ²(C), and the fixed point for channel k needs `E[w(S²) sₖ²] = κ`. The sₖ are exchangeable, so

    κ(C) = E[w(S²) sₖ²] = E[w(S²) S²] / C,   S² ~ χ²(C)

For Tukey, `w(X) X = (X − 2X²/c² + X³/c⁴) 1(X < c²)`, and `E[Xᵐ 1(X < a)] = 2ᵐ Γ(C/2+m)/Γ(C/2) · P(C/2+m, a/2)`, with P the regularised lower incomplete gamma function. So:

    κ(c, C) = P(C/2+1, c²/2) − 2(C+2)/c² · P(C/2+2, c²/2) + (C+2)(C+4)/c⁴ · P(C/2+3, c²/2)

P is evaluated in closed form for half-integer orders (pure Python, `math` only), using the recursion `P(a+1,x) = P(a,x) − xᵃe⁻ˣ/Γ(a+1)`. The result is cached. For C = 1 it matches #120's integral to about 1e-16. For C > 1 it matches a χ² quadrature to 1e-6. **Non-joint losses, and joint with C = 1, keep exactly #120's `_tukey_kappa(4.685)`, so they are bitwise unchanged.**

### 1b. Tukey's default c scaled with C (approved by the maintainer)

**Why the threshold has to change.** With a fixed c = 4.685, κ(C) alone is not enough. The noise norm is about √C, so c gets relatively closer to it as C grows, and two things go wrong:

- **Robustness drops.** Let g(a) = E[w(aX) aX]/C be the expected `mean(w sₖ²)` when lam is a times the precision. With a fraction ε of zero-weight voxels (gross outliers), a finite lam exists only while (1 − ε) maxₐ g(a) ≥ κ = g(1). So the breakdown of the estimated precision is `ε* = 1 − g(1) / maxₐ g(a)`. At c = 4.685 this falls from 49% at C = 1 to 3% at C = 5.
- **Instability.** For C ≥ 7, a = 1 lies past the maximum of g. The Gaussian precision is then an *unstable* fixed point, and lam diverges to inf even on clean noise.

**Rule.** When c is not given and `joint=True`, c(C) is chosen so that ε*(c(C), C) = ε*(4.685, 1) = 48.7%. In other words, the estimated precision tolerates the same fraction of gross outliers for any C. This addresses both of the maintainer's criteria:

- **(b) comparable robustness**, by construction;
- **(a) stability**: with ε* = 49%, the maximum of g is at a ≈ 3.6–5.8 > 1 for every C, so a = 1 is on the increasing side. This is checked up to C = 64.

c(C) is about 3.3 √C for large C. Its Gaussian efficiency (C-variate location) is never below 95%: it rises from 95% at C = 1 to 99.3% at C = 10.

I also tried two alternatives:

- **Same 95% Gaussian efficiency:** c(C) = 5.12, 5.49, … 7.22 for C = 2 … 10. The breakdown still falls (38% → 11% at C = 10), and the fixed point is unstable again for large C (C = 64).
- **Same χ²(C) quantile** as 4.685² for χ²(1): the breakdown falls even faster (5% at C = 10).

**Explicit c.** A c given explicitly (`Tukey(c=...)`) is used as is, as a raw threshold on the joint norm, and is never scaled. `Tukey.scale_c` records whether c is auto-scaled. The C ≥ 7 instability warning now fires only for such an explicit c: the default never warns, which is tested for C = 1 … 10.

| C | c(C) | κ(c(C), C) | stable | breakdown ε* with c(C) | ε* with fixed c = 4.685 | Gaussian eff. with c(C) |
|---|---|---|---|---|---|---|
| 1 | 4.685 | 0.7578 | yes | 48.7% | 48.7% | 95.0% |
| 2 | 5.835 | 0.7857 | yes | 48.7% | 30.6% | 97.0% |
| 3 | 6.752 | 0.7975 | yes | 48.7% | 17.6% | 97.9% |
| 4 | 7.542 | 0.8039 | yes | 48.7% | 8.6% | 98.3% |
| 5 | 8.248 | 0.8078 | yes | 48.7% | 3.0% | 98.6% |
| 6 | 8.893 | 0.8105 | yes | 48.7% | 0.4% | 98.8% |
| 7 | 9.492 | 0.8124 | yes | 48.7% | unstable | 99.0% |
| 8 | 10.054 | 0.8139 | yes | 48.7% | unstable | 99.1% |
| 9 | 10.584 | 0.8150 | yes | 48.7% | unstable | 99.2% |
| 10 | 11.088 | 0.8159 | yes | 48.7% | unstable | 99.3% |

### MAD needs no C-dependent κ

With joint weights, ρ(s) = ‖s‖ is the negative log-likelihood of the C-variate density `∝ Πₖ √lamₖ · exp(−‖s‖)`, whose normaliser does not depend on lam. So κ = 1 is the exact maximum-likelihood estimate for any C. It is unbiased under that model, since ‖s‖ ~ Gamma(C, 1) gives E[w sₖ²] = E‖s‖/C = 1.

As for C = 1, MAD's lam is not a Gaussian precision: on Gaussian noise it is `(C/E[χ_C])²` times the precision with joint weights, and π/2 times it otherwise. Making it Gaussian-consistent would change the non-joint behaviour, and the value would no longer be a likelihood. MAD is unchanged.

### λ bias table

Gaussian noise with per-channel precisions (4, 0.25, 1, 9, 2, 0.5, 3, 1.5, 6, 0.8)[:C], 256² voxels per channel. Entries are λ_est / λ_true, as ranges over the channels.

| Tukey, joint | C = 1 | C = 2 | C = 3 | C = 5 | C = 8 | C = 10 |
|---|---|---|---|---|---|---|
| master (κ(1), c = 4.685) | 0.998 | 1.19–1.20 | inf | inf | inf | inf |
| κ(C), c = 4.685 (first version of this PR) | 0.998 | 0.999–1.008 | 1.001–1.014 | 0.989–1.007 | inf | inf |
| **κ(C), c(C) (now)** | 0.998 | 0.999–1.007 | 1.000–1.013 | 0.995–1.012 | 0.990–1.011 | 0.991–1.011 |
| same, 5% outliers per channel, c = 4.685 | 1.057 | 1.12–1.15 | 1.37–1.38 | inf | inf | inf |
| **same, 5% outliers per channel, c(C)** | 1.057 | 1.06–1.11 | 1.10–1.15 | 1.19–1.31 | 1.39–1.57 | 1.51–1.76 |

With 5% outliers per channel, 1 − 0.95^C of the voxels have at least one outlier channel (40% at C = 10), and joint weights reject the whole voxel. That is why λ is overestimated as C grows.

Unchanged rows: Tukey non-joint (0.99–1.01 for all C), MAD non-joint (≈ π/2) and MAD joint (≈ (C/E[χ_C])² = 1.571, 2.546, 3.534, 5.522 for C = 1, 2, 3, 5).

### 2. Verbose display of lam (`losses/robust.py`, `pairwise_impl.py`)

- The IRLS stores the final lam in `_last_lam`, whatever `cache` is set to; `clear_state` clears it.
- `RobustLoss.weighted_lam(moving, fixed, mask, dim)` returns lam·w:
  - with an estimated lam, it does one reweighting at `_last_lam`, with no IRLS loop;
  - otherwise it falls back to `irls`;
  - in both cases it leaves the cached lam unchanged. Before, the display's IRLS warm-started the next loss evaluation.
- The three display sites (`do_vel`, `do_affine`, `do_affine_only`) call `weighted_lam` instead of `irls`. Only the displayed map changes; the objective and the bookkeeping in `print` are untouched.
- At the `do_vel` display site, `aff_right` is None when the right affine is the identity (for example, nonlinear-only registration, or an affine on the moving side). `-v 3` used to crash there. The rotation is now skipped, and `disp` (then `phi00` itself) is cloned before being scaled.

## Tests

`test_register_robust.py` goes from 28 to 80 tests (52 new). **30 of the new tests fail on master.**

- **κ:** closed form against #120's integral and against a χ² quadrature, plus the quoted values.
- **`test_tukey_c_scaling`:**
  - c(1) == 4.685 exactly, and c(C) matches the table;
  - ε* equals 48.7% and the fixed point is stable (with contraction) for C = 1 … 10, 16, 32, 64;
  - with a fixed c = 4.685: stable for C ≤ 6, unstable for C = 7 … 10, and ε* < 5% at C = 5.
- **`test_tukey_c_used`:** the scaled c is used only when c is the default and the weights are joint (C > 1). An explicit c is used raw. The loss with the default c equals the loss with an explicit c(C), for estimated and fixed lam.
- **λ unbiased within 3%** on Gaussian noise for C = 1, 2, 3, 5, 8, joint and non-joint (Tukey). For MAD, the checks use the factors above on Gaussian noise, and λ_true on MAD's own noise model.
- **`test_tukey_joint_lam_with_outliers[5, 8]`:** finite and within (1, 1.6) with c(C); diverges with c = 4.685 (with the warning for C = 8).
- **FD of the value vs the gradient:** joint weights, C = 3, 5, 8, 5% outliers per channel (MAD and Tukey).
- **Warning:** fires for an explicit unstable c, never for the default.
- **Display tests:**
  - `weighted_lam` does one reweight and no IRLS, and leaves the state unchanged;
  - on the three `PairwiseRegisterStep(verbose=3)` sites, the second call makes 1 `irls` call (master: 2) and shows the same map;
  - a nonlinear-only registration gives the same objective and parameters with verbose 0, 1 and 3.
- **torch 1.13 jitter fix:** comparisons between separate evaluations use `allclose(rtol=1e-12, atol=1e-12·max|b|)` instead of `torch.equal`, as in #152.
  - On torch 1.13, the first registration of the verbose test runs unfused TorchScript kernels and differs from later ones by about 1e-9 in the objective and 5e-8 in the parameters. This was measured with verbose 0 every time, and is 0 with the fuser disabled. IRLS and 3 GN iterations amplify it.
  - So that test now runs a warm-up registration and compares the following ones; those are bitwise equal in practice.
  - Deliberate bitwise checks were kept: `kappa(nb_channels=1) == _tukey_kappa`, `_tukey_c(1) == 4.685`, and default c vs explicit c(C) within one call pattern.
- **`test_register_loss_alloc.py`:** only `tukey-est-joint-batch` changed (joint Tukey, K = 2, now with c(2) and κ(c(2), 2)). Its reference is bitwise master's `robust.py` with only c and κ replaced. The other 48 tests are unchanged.

### Results

| run | interpreter | result |
|---|---|---|
| `test_register_robust.py` + `test_register_loss_alloc.py` | system Python / torch 2.15 | **129 passed** |
| same two files | py3.9 / torch 1.13.1 venv | **129 passed** (the CI failure is fixed) |
| fast set `nitorch/tests/test_register_*.py` | system torch | **809 passed, 28 skipped** |

All runs used `PYTHONPATH` set to the worktree.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01MHwEa9dAf8MwawzzozKLzE

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `592f360d3db2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.