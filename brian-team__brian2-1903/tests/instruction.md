# Issue

**Title:** Return copies, not views on C++ dynamic arrays, from x[:] and StateMonitor accessors (regression since 2.10)

## Description

Part 1 of #1897, as agreed there: `x[:]` returns a copy for variables stored in a dynamic array, so that the returned array no longer refers to the memory of the C++ vector. Static arrays (part 2) are left unchanged.

### Changes

`brian2/core/variables.py`:
- `get_with_index_array` copies the values when the variable is a `DynamicArrayVariable` and the values are obtained with a slice (`[:]`, `[:, None]`, or another slice that `indexing` passes on as a slice). Index arrays already returned a copy. Static array variables (e.g. `G.v[:]`) still return a view.
- `VariableView.__array__` no longer copies these values a second time (`np.array(S.w)` would otherwise copy twice).

`brian2/monitors/statemonitor.py`: `mon.var_` and `mon[k].t` / `mon[k].t_` returned the stored dynamic arrays directly, without going through `VariableView`; they now return copies (`mon.var` with units already did).

`brian2/memory/cythondynamicarray.pyx`: `DynamicArray1DClass.data` and `DynamicArray2DClass.data` set the dynamic array as the base of the returned numpy array (`cnp.set_array_base`), so that code using `.data` directly keeps the owner alive. As you noted in #1791, this does not protect against a reallocation when the array grows.

`examples/frompapers/Maass_Natschlaeger_Markram_2002.py`: replaced `synapses.U[:][synapses.U < 0] = U` (and the same for `D` and `F`), which changed the synapses through the returned view and no longer would. The rewrite draws the same random numbers in the same order: for a fixed seed, `U`, `D` and `F` of the 680 synapses of an E→E projection are bit-identical to master, while the old lines with this branch would leave 12, 16 and 11 invalid values. (As you mentioned in #1897, `synapses.U[synapses.U < 0] = U` would be the natural replacement, but boolean indices are currently read as integer indices, .)

`docs_sphinx/user/models.rst`: a note on which variables return a copy with `[:]` and how to change a subset of values.

### Tests

- `test_memory.py::test_dynamic_array_data_keeps_array_alive` (codegen independent): `.data` of 1D and 2D dynamic arrays has the dynamic array as base and stays valid after the dynamic array is deleted and memory is reallocated.
- `test_monitor.py::test_monitor_values_are_copies`: the values returned by `SpikeMonitor`, `StateMonitor` (including `mon.v_` and `mon[0].t`) and `PopulationRateMonitor` do not share memory with the stored arrays, and keep their values after further runs and after the monitors are deleted.
- `test_synapses.py::test_state_variable_get_all_copy`: `S.w[:]` and `S.i[:]` are copies that survive a further `connect`, writing into them does not change the synapses, and conditional assignment on the variable itself still works.

On master, all five runs (codegen independent, and the two runtime tests with numpy and Cython) fail; with this branch they pass.

### Validation

Linux (WSL Ubuntu 24.04), gcc 13.3, Python 3.13.14, numpy 2.5.4, Cython 3.3.0, on master 26d8f10 (2.11.0) with the extensions built from source for each tree. Windows and macOS were not tested locally.

- Full test suite (`brian2.test(["cython", "numpy"], test_codegen_independent=True)`, long tests excluded): with this branch, 56 doctests, 452 codegen-independent, 311 Cython and 314 numpy tests pass; on master, 56, 451, 309 and 312 (the difference is the new tests). The only failure, `test_base.py::test_version`, occurs on both, because the tests ran from a source copy without `setuptools_scm`.
- Reproduction script from #1897 (default target, 5 runs per tree): on master, 4 runs out of 5 return 99.99 to 100 % wrong values in both cases (the other run returned correct values); with this branch, 0 % in all 5 runs.
- Cost for 10^6 values (numpy target, one pinned core on a busy machine, two alternating rounds): `S.w_[:]` goes from about 6 µs to the cost of one copy (2.8 to 3.3 ms here), the same order as `np.array(S.w)` on master (2.9 to 3.4 ms). `np.array(S.w)` stays at 2.9 to 4.1 ms, since it still copies once (without the change in `__array__` it would copy twice). Absolute times on this loaded machine are about three to four times those quoted in #1897.
- This branch merges with #1902 without conflict, and on the merged tree the new tests of both PRs pass (numpy and Cython).
- ruff 0.14.2: `ruff format` and `ruff check` report nothing on the changed files under `brian2/` (the example file was already not formatted on master and is outside the hook).

### Not included

Part 2 of #1897: static arrays, read-only variables such as `G.i[:]`, and the shuffling recipe in `recording.rst`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bc858d2fee5a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.