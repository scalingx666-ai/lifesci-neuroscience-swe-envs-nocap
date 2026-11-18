# Issue

**Title:** Support a SortingAnalyzer with no unit in the core extensions

## Description

A `SortingAnalyzer` built from a sorting with no unit crashes on the first extension with `ValueError: need at least one array to concatenate`, which is the traceback reported in the issue. This comes up in real pipelines when a curation step removes every unit, for example when one shank of a multishank recording yields nothing. @alejoe91 confirmed in the issue that an analyzer with no unit is still a valid analyzer and should be handled.

There are three places where the zero-unit case falls over. In `random_spikes_selection`, the per-unit loop never runs so `np.concatenate` gets an empty list. In `extract_waveforms_to_single_buffer` and in `estimate_templates_with_accumulator`, the sparse branch computes `int(max(np.sum(sparsity_mask, axis=1)))` on a mask that has no row, so builtin `max` raises on the empty iterable. `estimate_templates_with_accumulator` additionally asserts `spikes.size > 0` up front.

The fix returns empty results at each of those points. `random_spikes_selection` returns an empty int64 array, the two channel-count computations use `np.max(..., initial=0)`, and `estimate_templates_with_accumulator` returns zero-filled templates when there is no spike rather than allocating a zero-sized shared memory buffer. That last change also covers the case where units exist but all of them have zero spikes, which previously tripped the same assert. With these, `random_spikes`, `noise_levels`, `waveforms` and `templates` all run on an empty analyzer in both dense and sparse mode, and the analyzer round-trips through the memory, binary_folder and zarr backends.

Tested with `test_analyzer_with_no_unit` (parametrized over sparse and dense) and `test_analyzer_with_only_empty_units` in `test_sortinganalyzer.py`, plus `test_random_spikes_selection_no_unit` in `test_sorting_tools.py` covering all four selection methods. Six of the seven new cases fail on main and all pass with the fix. The full `test_sortinganalyzer.py`, `test_sorting_tools.py`, `test_waveform_tools.py` and `test_analyzer_extension_core.py` suites pass together, 60 passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dbe2e7539ab6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.