# Issue

**Title:** Planted-structure tests for the property-only measures, plus nitime and mne-connectivity cross-checks

## Description

Closes the validation gaps found in the pre-release audit. Every measure that only had property tests now recovers a known planted structure, and two independent packages confirm the shared estimators:

- **Cross-spectral density**: a planted 40 Hz two-signal rhythm with a π/3 offset — peak bin, recovered phase (sign checked against `coherence_phase`), and the one-sided band integral equal to A₀A₁/2 within 5 %.
- **MIC / MIM** on six signals in two groups: a lagged shared rhythm gives MIC ≈ 1 at the rhythm and bias-level elsewhere; a zero-lag (volume-conduction) rhythm gives bias-level MIC while canonical coherence stays ≈ 1; MIM ≈ MIC² for the rank-one source. Thresholds are explained by the measured null distribution.
- **Blockwise Granger** on two-channel blocks against Geweke's block closed form on the exact VAR spectrum (`atol=1e-5`, reverse direction exactly 0, both Wilson paths), plus a simulated direction check.
- **Partial coherence** on a 0 → 1 → 2 chain: analytic inverse-spectrum oracle at `1e-8`, and on simulated data the mediated 0–2 link stays below 0.05 while pairwise coherence peaks above 0.8.
- **nitime**: coherence and one-sided CSD agree at roundoff once our `taper_weighting="eigen"` matches nitime's eigenvalue-weighted non-adaptive CSD (the cause of the earlier per-bin mismatch, recorded in the test docstring); every bin including DC and Nyquist is compared.
- **mne-connectivity 0.9**: a checked-in 92 kB reference fixture (generated once with `uv run --with mne-connectivity==0.9.0`, never a dependency) for coh, imcoh, plv, ciplv, ppc, pli, dpli, wpli, wpli2_debiased, psi and cacoh; eleven measures agree to 1e-12 (cacoh 1e-7) when fed MNE's periodic DPSS tapers. The seven phase measures agree in the single-taper setting; with several tapers the two packages' estimators differ by design (MNE combines tapers within each epoch before the phase step), which is recorded as `unmatched` and pinned by a test. One shared plain-data table drives both the generator and the test.

Shared VAR oracle helpers moved to `tests/_var_oracle.py`. No source or dependency changes.

Phase 6 of #89; stacked on #94 (retarget to `master` after it merges). Gate green locally: ruff, mypy, 1629 passed / 13 skipped; the 21 new tests take ≤ 0.1 s each.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8649585a18e2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.