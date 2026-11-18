# Issue

**Title:** Use `int64_t` instead of `long` in `synapses_create_generator.cpp`

## Description

.

The C++ standalone template for synapse creation declared the iteration variables as `long`. On macOS, `int64_t` is `long long`, so `_higher_type` has no specialisation for `long`, and `%` or `//` on `j` or `k` in `Synapses.connect` failed to compile (`no matching function for call to '_brian_mod'`). As suggested in the issue, this replaces every `long` in `synapses_create_generator.cpp` with `int64_t`. On Linux, where `int64_t` is `long`, the generated code is unchanged.

### Tests

New cases in the existing `test_synapse_generator_deterministic` and `test_synapse_generator_deterministic_over_postsynaptic`:

- generator expressions with `k % 2 == 0` and `k // 4 == i // 4` (and the `j` versions when iterating over the presynaptic side)
- conditions `(i + j) % 3 != 0` and `j // 4 == i // 4`

Each result is compared with the expected connectivity matrix computed with numpy.

On macOS (arm64, Apple clang 21.0.0, Python 3.13):

- Without the template change, both tests fail on `cpp_standalone` with `no matching function for call to '_brian_mod'` / `'_brian_floordiv'`.
- With the change, both tests pass on `numpy`, `cython` and `cpp_standalone`.
- Full `cpp_standalone` test suite, including long tests (`brian2.test([], test_standalone="cpp_standalone", long_tests=True)`): 270 passed, 2 skipped, no failures. This includes `test_synapse_generator_deterministic_2`, which also uses this template.
- `cpp_standalone` tests matching `synapse` with `float_dtype=float32`: 72 passed, no failures.
- `ruff format --check` (v0.14.2) reports no changes.

I haven't tested on Windows or Linux locally, so I'm relying on CI for those.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `26d8f10291da`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.