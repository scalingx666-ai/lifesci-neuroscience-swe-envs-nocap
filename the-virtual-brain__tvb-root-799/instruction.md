# Issue

**Title:** Add Gast/Solla/Kennedy (2024) Izhikevich mean-field model + Fig. 2 reproduction demo

## Description

## Summary

Adds the TVB model `GastSollaKennedy` — the adaptive-Izhikevich mean-field reduction of Gast, Solla & Kennedy (2024, PNAS 121(22) e2311885121) — with traditional and hybrid backend registration, tests, and two executed demos, including a reproduction of Fig. 2 of the paper.

## What's included

- **feat(models)**: `tvb_library/tvb/simulator/models/gast_solla_kennedy.py` — 4D mean-field model (r, v, u, s), 15 parameters (defaults = regular-spiking column of Table 1, Δ ≈ 0.5), Lorentzian heterogeneity, numba codegen drift functions, r ≥ 0 boundary. Registered in `models/__init__.py` (`ModelsEnum` + `_module_models`) and in the nb-hybrid backend (`_SUPPORTED_MODELS_CACHE` + allowed-model error string).
- **test(models)**: init test in `models_test.py` (4 state variables); hybrid coverage in `backend/test_nb_hybrid.py` (`_RALPH_MODELS`); new traditional-Simulator parity test `models_gast_solla_kennedy_test.py` against an independent plain-NumPy Heun integration.
- **docs(demo)**: Fig. 2 reproduction (`reproduce_figure_Gast_2024_PNAS.{py,ipynb}` + figure asset) and a resting-state demo on the full 76-region connectome (`simulate_gast_solla_kennedy_resting_state.{py,ipynb}`), both executed with committed outputs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e3ac3f18d5bf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.