# Issue

**Title:** Fix SynapticIndexing when index_var=="0"

## Description

## Why

Reading a synaptic variable linked to a variable from a length-1 source group raises an `IndexError`:

 ```python
source = NeuronGroup(1, "dx/dt = -x / (10*ms) : 1")
group = NeuronGroup(3, "")
syn = Synapses(group, group, "x : 1 (shared, linked)")
syn.connect(i=[0, 1, 2], j=[0, 1, 2])
syn.x = linked_var(source, "x")
syn.x  # IndexError: index 1 is out of bounds for axis 0 with size 1
```

Differential equations can't be declared `(shared)` directly, so a length-1 source group is the only way to get a broadcast value out of one. `linked_var()` picks up on this (thanks #1584) and sets the linked variable's index to `"0"` (`Group._linked_var_automatic_index`), but `SynapticIndexing.__call__` didn't handle that case and fell through to indexing the length-1 value array with the full array of synaptic indices.
`test_linked_variable_scalar` (`test_neurongroup.py`) already proves `Group` handles this correctly, including direct indexing (`G2.x[:]`). The equivalent `Synapses` test, `test_linked_to_shared_variables`, covers the same setup but only reads the linked variable back through a `StateMonitor`.

## Fix
`SynapticIndexing.__call__` now special-cases `index_var == "0"`, returning zeros to index the length-1 source array with, consistent with how `"0"` is already handled elsewhere (e.g. `group.py`).

## Testing
Added a single direct-indexing assertion on `test_linked_to_shared_variables`, which fails with the original `IndexError` on master and passes with the fix. It now also asserts that `linked_var()`'s guess actually resolves to `index_var == "0"`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0aee8b1aae94`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.