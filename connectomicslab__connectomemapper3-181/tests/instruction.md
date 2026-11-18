# Issue

**Title:** DOC/FIX: Use HTTPS instead of SSH for `datalad clone` in notebooks

## Description

This PR resolves
- #178

by using https instead of ssh in the URL provided to `datalad clone` of the VEPCON dataset in the `analysis_tutorial.ipynb` and `EEG_pipeline_tutorial.ipynb`.

It also fixes a bug in the `plot_lausanne2018_surface_ctx()` function of the `cmtklib.data.parcellation.viz` module (commit )

The two notebooks have been entirely rerun.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `af079cffabfa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.