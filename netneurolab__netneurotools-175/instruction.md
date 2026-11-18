# Issue

**Title:** [ENH] Add `plot_parcellated_data` function

## Description

This commit adds the `pv_plot_parcellated_data` function. It take as input a parcellated brain map and a parcellation, then plots the parcellated data on the surface of the cortex.

To allow the `data` parameters to be either a single array (with left then right hemisphere data) or a tuple/list (left data, right data), I modified `parcels_to_vertices` as well. This is inspired from `pv_plot_surface` which allows `vertex_data` to be either a tuple of two arrays or a single concatenated array.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `034c2dd02adc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.