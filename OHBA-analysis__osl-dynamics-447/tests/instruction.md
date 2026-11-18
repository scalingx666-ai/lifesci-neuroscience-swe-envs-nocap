# Issue

**Title:** Regression spectra: identifiable mixture model, group-level sigma and signed coherence

## Description

## Summary

On `main`, `regression_spectra` adds a session-dependent offset to every mode's coefficients. When alpha sums to one, the regression with an intercept has no unique solution, and the windows overlapping the zero padding at the start and end of each session decide the offset. The coefficients come out as roughly `sigma_j * P_j` (the whole mode spectrum) instead of the change from the static spectrum.

This PR makes the regression identifiable, puts all sessions in the same units, redefines the coherence and documents how to interpret and plot the outputs.

## Changes

**`regression_spectra`**
- Fits the spectrogram as a mixture of mode spectra, `P_t = sum_j alpha_jt P_j`, using only windows fully inside the data. The intercept is the static spectrum `S`; the coefficients are `sigma_j (P_j - S)`, the change for a one standard deviation increase in a mode's alpha.
- `sigma_j` is a group-level value (weighted average over sessions) applied to every session. New `return_sigma` option gives `P_j = S + coef / sigma_j`.
- `coh` is the change in the cross spectrum normalized by the static power (change in coherence): `Re(coef_xy exp(-i phase(S_xy))) / sqrt(S_xx S_yy)`. It is signed and linear in the coefficients. The old `|coef| / sqrt(S_xx S_yy)` is biased upward by noise and positive for almost every edge.
- Alpha is averaged over each window weighted by the squared taper.
- Modes whose alpha barely varies in a session get NaN coefficients for that session.
- Errors if a session has no more windows inside the data than modes; `keepdims` is respected with `calc_coh=False`.
- The fit uses a chunked pseudo-inverse instead of sklearn; peak memory is similar to `main`.
- Removed `rescale_regression_coefs`.

**Docs, tutorials and examples**
- New User Guide page, *Spectral Analysis*: the model, `S`, `P_j` and `sigma_j`, the outputs, relation to the HMM multitaper, and what to plot (PSDs with and without the static PSD, power maps, coherence networks).
- Tutorials 5-1/5-2, the examples and `plot_group_tde_dynemo_networks`: raw DyNeMo mixing coefficients (not `reweight_alphas`), no mean subtraction, and coherence networks showing the largest changes (increases and decreases). Coherence maps are no longer recommended.
- The precomputed spectra for tutorial 5-2 on OSF have been regenerated with this code.

## Verification

Real data (55 subjects, 42 parcels, DyNeMo and HMM fits with 10 modes/states):
- DyNeMo power maps without mean subtraction match the old mean-subtracted maps (r = 0.98-1.00, modes 1-9); the background mode is negative everywhere.
- Coherence networks are compact and match the power maps; HMM states that lower power have networks of decreases.
- Regression vs `multitaper_spectra` for the HMM: maps of `P_j - S` correlate 0.91-0.99.

Simulations: `S = sum_j abar_j P_j` holds and edge cases (unvisited states, nearly constant alpha, short sessions) behave as documented.

## Behavior changes (release notes)

- `regression_spectra` coefficients and `coh` change; `coh` is signed.
- Coefficients use a group-level `sigma_j`, so results depend on the sessions passed in one call.
- New `return_sigma` argument; `rescale_regression_coefs` removed.
- Recommended plotting: no `subtract_mean` for regression spectra; coherence networks show the largest changes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8774fc76ec33`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.