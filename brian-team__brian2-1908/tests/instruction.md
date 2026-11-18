# Issue

**Title:** Prefix local variables in the Cython `synapses.pyx` template with underscores

## Description

.

The Cython template for synaptic propagation used `i` as its loop counter, which clashed with the presynaptic index `i` in `on_pre`/`on_post` code. As discussed in the issue, this renames all local variables of `synapses.pyx` with a leading underscore, so they can't clash with user-defined names:

| Before | After |
|---|---|
| `i` | `_spike_idx` |
| `num_spikes` | `_num_spikes` |
| `synapse_id` | `_synapse_id` |
| `spike_data` | `_spike_data` |
| `spike_vector` | `_spike_vector` |
| `cpp_queue` | `_cpp_queue` |
| `capsule` | `_capsule` |

The new names don't appear anywhere else in the Cython runtime or templates, apart from `_num_spikes` in `ratemonitor.pyx`, which is compiled as a separate module.

### Test

New `test_transmission_names_of_template_variables` in `test_synapses.py` (standalone compatible):

- `on_pre="v_post += i"`
- `on_post="u_pre += i"`, with presynaptic indices 5 to 9 only. A clash with the loop counter then makes the loop stop early, so a regression shows up as a test failure instead of a hang. The hang can't be interrupted by pytest-timeout, because the loop is compiled code.
- synaptic variables called `num_spikes`, `synapse_id`, `spike_data`, `spike_vector`, `cpp_queue` and `capsule`, used in `on_pre`

On macOS (arm64, Apple clang 21.0.0, Python 3.13.15, Cython 3.3.0, numpy 2.5.4):

- Without the template change, the test fails on `cython` (`v` is `[0, 0, 0]` instead of `[0, 1, 2]`; `u` is `[0, 0, 0, 0, 0, 5, 0, 0, 0, 0]` instead of `[0, 0, 0, 0, 0, 5, 6, 7, 8, 9]`; Cython reports `'num_spikes' redeclared` etc.).
- With the change, the test passes on `numpy`, `cython` and `cpp_standalone`.
- Full `cython` test suite, including long and codegen-independent tests: 56 doctests and 455 codegen-independent tests passed; 316 Cython tests passed, 10 skipped. The only failure was `test_spikegenerator_rounding_long` hitting the 1 h pytest timeout while running in parallel with the other workers. Run on its own, it passes and takes the same time with and without this change (37:27 vs. 37:20 on `master`).
- `ruff format --check` (v0.14.2) reports no changes.

The examples from the issue now give the same results as `numpy` with `cython` (`[0. 1. 2.]` and `[2. 4. 6.]`, the latter finishing in a few seconds).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `296cb1f17300`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.