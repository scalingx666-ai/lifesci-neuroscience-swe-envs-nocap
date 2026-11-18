# Issue

**Title:** Clean up code around create_sorting_analyzer and create/load_* functions in sortinganalyzer.py

## Description

This PR does not functionally change much. It is mainly for code refactoring and to improve legibility.

The only two functional changes are:
* fix small bug when calling save_to_zarr("test.zarr") would add an extra .zarr to the filename (https://github.com/SpikeInterface/spikeinterface/blob/39dfac40e630ff996be410aa62a54f5ff6b7eb11/src/spikeinterface/core/base.py#L1087)
* when return_scaled and return_in_uV are provided, prioritize return_in_uV. Currently, it prefers return_scaled over return_in_uV

Code quality improvements:
* type hinting
* Collect code into logical blocks (e..g, everything that has to do wit main indices together); add comment headers (e.g., Saving main indices) and reorder this blocks (e.g., expected stuff like sorting should be saved and loaded before any of the optional things like sparsity)
* Make create_binary_folder parallel create_zarr (you can now see how they are both doing exactly the same). 
* Make load_binary_folder parallel load_zarr.
* Preserve the same order of operations when loading and saving. If sorting was saved first, then load first and so on.
* Tighten code when possible

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ecf5c6d60933`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.