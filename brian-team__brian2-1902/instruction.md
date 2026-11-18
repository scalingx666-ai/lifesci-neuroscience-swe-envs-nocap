# Issue

**Title:** Support boolean masks as indices for synaptic variables

## Description

.

Indexing a synaptic variable with a one-dimensional boolean array treated the mask as integer indices. `SynapticIndexing.__call__` passed it through `np.asarray(...).astype(np.int32)`, so `S.j[S.j >= N_E]` returned the values of synapses 0 and 1 over and over, and `S.w[mask] = x` only changed those two synapses. This is the behaviour mentioned in #1897 as well (`S.U[S.U < 0]`).

`Indexing` for neuron groups already converted masks with `np.nonzero`, but it did not check the length, so a mask that was too short silently selected a subset (`G.i[np.array([True, False, True])]` gives `[0, 2]` for a group of 50 neurons).

Changes:

- New helper `boolean_index_to_indices(mask, size)` in `brian2/groups/group.py`. It raises an `IndexError` unless the mask has exactly one entry per indexed element (same rule as numpy) and returns the indices of the `True` entries.
- `SynapticIndexing` uses it with the number of synapses, so `S.w[mask]`, `S.w[mask] = ...`, `S.j[mask]` and `S.indices[mask]` select the expected synapses.
- `Indexing` uses it with the same size as its slice branch (the group size, or the size of the index variable for subgroups).
- One sentence in the synapses user guide about boolean indices, since the reporter found this unclear.

The length check is a small behaviour change for neuron groups: a mask of the wrong length now raises instead of being accepted. I think that matches what people expect from numpy, but I can drop that part if you prefer to keep this PR to synapses only.

Tests:

- `test_synapses.py::test_state_variable_boolean_indexing` (get, set, list of booleans, all-False mask, wrong shapes)
- `test_subgroup.py::test_state_variables_boolean_index`
- extra checks in `test_neurongroup.py::test_state_variable_access`

On unchanged master the synapse test fails (`S.j[mask]` gives `[0, 9, 0, 9, 0, 9, 0]` instead of `[9, 8, 9]`) and the neuron group length check does not raise. The subgroup test already passed on master and is there to cover the subgroup size.

Local runs on macOS arm64, Python 3.13, numpy 2.5.4, through `brian2.test(["numpy"], test_codegen_independent=True)`: doctests 56 passed, codegen-independent 453 passed and 4 skipped, numpy target 304 passed and 15 skipped. pre-commit passes on the changed files. I did not run the Cython or standalone targets locally, and I did not build the docs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `26d8f10291da`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.