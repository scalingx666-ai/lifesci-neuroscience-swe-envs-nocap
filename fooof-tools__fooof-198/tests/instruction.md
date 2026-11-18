# Issue

**Title:** [ENH] Combined plot_spectra and plot_spectrum

## Description

This addresses a point in #193. `plot_spectra` not accepts 1d arrays and `plot_spectrum` has been replaced by `plot_spectra` throughout the module. The same has been done with `plot_spectra_shading`, with `plot_spectrum_shading` removed.

Also, `plot_spectrum` has been aliased to `plot_spectra` in the \_\_init\_\_.py to not break anyone's code. This wasn't done for `plot_spectrum_shading` since it's not imported in the init.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `083cc08f1677`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.