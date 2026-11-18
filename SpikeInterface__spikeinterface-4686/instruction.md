# Issue

**Title:** Use MEDiCINe's own recommended default for num_depth_bins

## Description

## Summary
- The `medicine` motion estimation preset (`MedicineRegistration.run` in `src/spikeinterface/sortingcomponents/motion/medicine.py`) computed `num_depth_bins` by dividing the probe's depth span by `win_scale_um`, a generic windowing parameter tuned for other methods (`dredge`, `decentralized`, etc.), defaulting to 300 µm. For a typical probe this yields far more depth bins than MEDiCINe is designed for.
- MEDiCINe's own package (`medicine.run.run_medicine`) defaults and documents `num_depth_bins=2` as sufficient for all of its authors' recording sessions, independent of any window-scale concept.
- All other MEDiCINe hyperparameter defaults in `MedicineRegistration.run` (`motion_bound`, `time_kernel_width`, `activity_network_hidden_features`, `amplitude_threshold_quantile`, `batch_size`, `training_steps`, `initial_motion_noise`, `motion_noise_steps`, `learning_rate`, `epsilon`) already match `medicine`'s own defaults exactly — `num_depth_bins` was the one outlier.
- This PR adds an explicit `num_depth_bins=None` parameter to `MedicineRegistration.run`. When unset, it now defaults to `1 if rigid else 2` (MEDiCINe's own recommendation) instead of being derived from `win_scale_um`/`win_margin_um`. Users who want a different value can still pass `num_depth_bins` explicitly through `estimate_motion_kwargs`.
- Also filled in the previously empty `params_doc` docstring for this method, and removed a leftover debug `print()`.
- No other preset or the shared `estimate_motion()` signature/defaults were touched, so this is backwards compatible for all other motion estimation methods.

## Dependencies
- `medicine-neuro` was not previously referenced anywhere in `pyproject.toml`. Added it to the `test-sortingcomponents` dependency group (alongside `torch`, following the same pattern) so the new test below actually runs in CI rather than being skipped, and added an explanatory comment next to the existing `torch` comment in `[project.optional-dependencies].sortingcomponents` noting it's an optional heavy dep (itself pulling in `torch`) needed only for the `medicine` method — not bundled into that extra by default, same treatment as `torch`.

## Test plan
- [x] Added `src/spikeinterface/sortingcomponents/motion/tests/test_medicine.py` (skipped if the optional `medicine`/`torch` packages aren't installed):
  - Parametrized check that `num_depth_bins` resolves to MEDiCINe's own default (2 non-rigid / 1 rigid), independent of `win_scale_um`.
  - Direct equivalence check: given identical peaks and RNG state (`torch.manual_seed` / `np.random.seed`), the spikeinterface `medicine` `estimate_motion` wrapper produces output numerically identical to calling `medicine.run_medicine()` directly, confirming the wrapper's resolved settings and outputs match the original package.
- [x] `python -m pytest src/spikeinterface/sortingcomponents/motion/tests/` (full directory, 12 passed, no regressions)
- [x] `python -m py_compile src/spikeinterface/sortingcomponents/motion/medicine.py`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `55283a39febe`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.