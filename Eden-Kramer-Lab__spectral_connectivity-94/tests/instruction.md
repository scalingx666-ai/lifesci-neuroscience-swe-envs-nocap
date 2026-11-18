# Issue

**Title:** Public simulators, and a simulated-examples notebook that asserts what it plots

## Description

`spectral_connectivity.simulate` gains two public simulators alongside `simulate_MVAR`:

- `simulate_lagged_broadband(lags, noise_levels, n_time_samples, n_trials=None, random_state=None)`: noisy copies of one white-noise source delayed by whole samples (a smaller lag leads). Reproduces the test helpers it replaces bit for bit, so the notebook-test snapshots are unchanged.
- `simulate_shared_oscillation(frequency, sampling_frequency, n_time_samples, n_trials, amplitudes, *, phase_offsets, noise_levels, random_phase_per_trial, random_state)`: one sinusoid seen by every signal with per-signal amplitude and phase offset (a positive offset leads), random phase per trial, plus noise. Per-signal parameter lengths are validated; sign conventions are verified against `coherence_phase`, `group_delay`, `directed_phase_lag_index` and `phase_slope_index`.

The tests' private lagged-signal helpers and inline shared-source constructions are replaced by the simulators. `examples/Tutorial_On_Simulated_Examples.py` builds every section with them and ends each section with an assert on what its plot shows, at realistic noise levels: expected values within tolerance, peak far above chance, or after-onset far above before-onset. The phase-normalized sections (PLV, PLI, PPC) use a single taper and the prose explains why: with a pure narrowband rhythm the odd Slepian tapers are noise-dominated exactly at the rhythm's frequency, biasing equal-weight phase measures (measured PLV ≈ 0.65 at NW=2), while wPLI and coherence are essentially immune; multiple tapers remain the right default for broadband or real data. The canonical-coherence section now gives each group its own private rhythm so between-group coherence is tested against a real within-group signal, and the higher-noise variant asserts the section's actual claim (canonical coherence beats the best pairwise between-group value). Also fixed in the notebook: a wrong heading about frequency resolution, the "Cohereograms" typo, time axes that shifted window centres by half a window, and chance-level comments for squared measures.

Phase 5 of #89; stacked on #93 (retarget to `master` after it merges). Gate green locally: ruff, mypy, doctests, notebook snapshots unchanged, the slow notebook execution test, 1609 passed / 16 skipped.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cc6c36b78920`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.