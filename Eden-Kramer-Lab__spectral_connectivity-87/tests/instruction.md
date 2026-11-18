# Issue

**Title:** Split wrapper.py by responsibility; one registry record per measure

## Description

## Summary

Last of the post-#79 cleanup PRs; now based on `master`. It splits `wrapper.py` (3,435 lines on `master`) into focused private modules and makes the measure registry one record per measure. Wrapper outputs are unchanged. The user-visible changes are warning line numbers, the dask error naming the right function, keyword-only registry labels (private), and `UnsupportedMeasureError`'s module path.

### Structure

| Module | Lines | Holds |
|---|---|---|
| `_measure_registry.py` | 554 | `_MeasureSpec` (one record per measure), `_MEASURE_SPECS`, name validation and suggestions, method-request handling, label attrs |
| `_input_handling.py` | 896 | input validation, xarray dimension resolution, DataArray and Fourier-input unwrapping |
| `_frequency_bands.py` | 371 | frequency selection, band integration weights, band reduction |
| `_result_formatting.py` | 510 | per-measure xarray formatting, `UnsupportedMeasureError` |
| `_provenance.py` | 173 | provenance attributes and JSON/netCDF serialization |
| `wrapper.py` | 1,071 | the public API: `multitaper_connectivity`, `fourier_connectivity`, `connectivity_to_xarray`, `frequency_band_reduce`, `list_measures`, `MeasureInfo`, `DEFAULT_METHODS` |

- **No cycles.** The new modules never import `wrapper`, and `connectivity`/`transforms` import none of them. `UnsupportedMeasureError` lives in `_result_formatting` (which raises it) to avoid a cycle, and `wrapper` re-exports it.
- **Public API declared.** `wrapper.__all__` now names the public API, including `DEFAULT_METHODS` and the re-exported exception. The docs follow `__all__` (`autosummary_ignore_module_all = False`; no other documented module defines one). The built API pages are unchanged, apart from `DEFAULT_METHODS` now being documented and linked, and the exception's working [source] link.

### The registry
- `_MEASURE_SPECS` (shape and capability flags) and `_MEASURE_DESCRIPTIONS` (labels) were parallel dicts. `_MeasureSpec` now carries both, so adding a measure is one complete entry. Insertion order, which sets the Dataset's variable order, is preserved.
- **Keyword-only labels.** Every field after `output_kind` must be passed by name. Three labels are strings, so swapped labels would otherwise build silently and reach results and the generated docs.
- **`_wilson_directed_spec`** sets `is_directed`, `transpose_output` and `requires_two_sided` together for the ten Granger and DTF-family measures. A new measure of that kind can't miss the two-sided requirement and silently accept one-sided input.
- The record owns its derived metadata: `units_for`, `array_orientation` and `dims`. `list_measures` and the result labels read those instead of restating the rules.
- `_requested_methods` and `_requires_two_sided` replace the method handling and the two-sided checks that `multitaper_connectivity` and `fourier_connectivity` each wrote out.

### Fixes along the way
- **Warnings name the user's line.** The wrapper's seven warnings now use `utils.stacklevel_outside_package()` (from #85). The `squeeze=True`-with-many-signals warning pointed into `wrapper.py`.
- **Dask error names the right function.** A dask-backed DataArray passed to `fourier_connectivity` used to be reported as coming from `multitaper_connectivity`.
- **`UnsupportedMeasureError` reports its real module.** Overriding `__module__` to `wrapper` broke `inspect.getsource` and the docs' [source] link. `__all__` does that job now; pickling still works through the re-export.

## Merged with master

`master` changed wrapper code this branch moves:
- #84 changed the provenance backend attribute to use `ON_GPU`; that change now lives in `_provenance.py`.
- #86 changed `fourier_connectivity`'s sidedness flag to `_validated_flag`, and removed its FFT-order and complex checks in favor of `Connectivity`'s. `fourier_connectivity` stays in `wrapper.py`, and those changes merged cleanly.

## Verification

- **Outputs vs `master`, identical:**
  - every `multitaper_connectivity` output (all 35 measures plus the default set) in values, coordinates and attributes;
  - `list_measures()`;
  - 20 `fourier_connectivity` cases across sidedness declarations and method requests, including which calls raise and their messages.
- **Registry:** compares identical field by field before and after the keyword-only and factory changes.
- **Docs:** built before and after each docs-affecting change, with the same pages and the same warnings (91, all already present).
- **Performance:** the compute paths make the same number of function calls as `master`. The split adds about 0.3 ms at import.
- **Tests:**
  - warning attribution through `multitaper_connectivity` and `fourier_connectivity`;
  - the dask error naming `fourier_connectivity`;
  - positional registry labels are rejected.

  `test_measure_labels_cover_every_measure` is removed: it checked that the two old registry tables stayed in sync, which one record per measure now guarantees.
- **Full suite:** 1538 passed, 15 skipped. ruff, mypy, codespell and doctests are clean, and the `-p no:warnings` run passes. Local patch coverage is 87.8%; the uncovered lines are moved code that was just as uncovered on `master`.

## Compatibility

- **Private imports:** helpers moved out of `wrapper.py` must be imported from their new modules.
- **`UnsupportedMeasureError`:** its `__module__` is now `spectral_connectivity._result_formatting`. `from spectral_connectivity.wrapper import UnsupportedMeasureError` and pickling are unaffected.
- **Warnings:** they report the caller's line instead of a line inside the package.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f9ac57eb0603`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.