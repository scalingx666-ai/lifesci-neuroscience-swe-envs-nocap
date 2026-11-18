# Issue

**Title:** [ENH] Add subcortex plotting

## Description

This pull request adds support for subcortical surface data and corresponding plotting utilities to the codebase. It introduces a new dataset for subcortical surfaces, functions to fetch this data, and new plotting functions to visualize subcortical structures. The documentation and public API are updated to reflect these additions.

**Subcortical surface dataset integration:**

* Added a new dataset entry `tpl-subcortex_surface` to `datasets.json`, including download URL, MD5 checksum, and extraction instructions.
* Added a corresponding reference entry for `tpl-subcortex_surface` in `references.json`.
* Implemented the `_fetch_subcortex_surface` function in `fetch_template.py` to download and organize subcortical surface files.

**Plotting enhancements:**

* Exposed new plotting functions `pv_plot_subcortex` and `_pv_make_subcortex_surfaces` in the `plotting` module's `__init__.py` and updated the public API.

**Documentation updates:**

* Updated `docs/api.rst` to include the new plotting functions `pv_plot_subcortical` and `_pv_make_subcortex_surfaces`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e42c3f6ce8f6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.