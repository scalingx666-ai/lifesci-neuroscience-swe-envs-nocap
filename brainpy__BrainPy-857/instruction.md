# Issue

**Title:** fix(docs,inputs,rates): repair docs notebooks + Hz-input & RNNCell.reset(batch_size) bugs

## Description

## Summary
Ran every notebook under `docs/` in a memory-capped, strictly-sequential sandbox (the task warned this is easy to crash the host), triaged failures, and fixed them.

**Key finding:** most failures were an artifact of executing the notebooks against a *stale installed* `brainpy` build (the kernel's cwd is the notebook dir, so `import brainpy` resolved to site-packages, not the repo). Re-running against the repo source via `PYTHONPATH` cleared `simulation`, `training`, `optimizers`, `bp_training` with no code change. The remainder were genuine notebook API-drift plus two real `brainpy` bugs.

## brainpy bug fixes (with reproducing tests)
- **`inputs.sinusoidal_input` / `square_input`** — `braintools` now requires the frequency to carry `Hz` units (and, once `dt` is unit-carrying, the time args to carry `ms`); the wrappers passed bare numbers and raised `AssertionError: Frequency must be in Hz`. Now attach units before delegating. Tests in `brainpy/inputs/currents_test.py`.
- **`dyn.rates` RNNCell/GRUCell/LSTMCell/ConvLSTM `reset_state`** — only understood `batch_or_mode`, so the canonical `model.reset(batch_size=...)` convention (shared with `brainpy.dyn` neurons) silently reset to an unbatched shape and raised `MathError`. Now accept `batch_size` as an alias (back-compat `batch_or_mode` preserved; the existing `nvar` keyword test still passes). Tests in `brainpy/dyn/rates/rnncells_test.py`.

## Notebooks re-executed green
`tutorial_math/{array,Dedicated_Operators,control_flows,variables}`, `tutorial_toolbox/inputs`, `tutorial_FAQs/gotchas_of_brainpy_transforms`, `tutorial_training/{esn_introduction,build_training_models}` — fixes range from `bm.Array(...)` wrapping (in-place assignment on now-immutable jax arrays), `split_keys`→`split_key`, `while_loop` tuple carry, `bp.layers.{Reservoir,LSTMCell,NVAR}`→`bp.dyn.*`, a `raises-exception` tag for an intentional gotcha, to rewriting the `build_training_models` SNN example onto the `bp.dyn` projection API (`HalfProjAlignPost`/`Expon`/`CUBA`/`LifRef`/`Leaky`).

`tutorial_advanced/interoperation` gets a genuine `b.value` fix (wrap in `bm.Array`); its MNIST-download + multi-epoch CNN/RNN training tail is CPU-heavy and not re-run end-to-end here.

## Left as-is (heavy / optional-dep, documented not dropped)
Given the explicit crash constraint: `integrate_flax_into_brainpy` (10-epoch flax CNN times out on CPU), `integrate_bp_{convlstm,lif}_into_flax` (need `tensorflow_datasets`), `dde_numerical_solvers` (`bp.fde.GLShortMemory` allocates a ~3 GiB array), and the `clear_buffer=True`/multi-device cells of `parallel_for_parameter_exploration` (`clear_buffer_memory()` deletes the live JAX ordered-effects token reused by the next batch; the core demo works).

## Tests
`currents_test.py`, `rnncells_test.py` + touched-module regression sweep (`currents_coverage_test.py`, `rates_test.py`, `nvar_test.py`, `nvar_coverage_test.py`) all pass.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `01aa0c83e588`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.