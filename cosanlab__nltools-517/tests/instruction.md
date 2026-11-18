# Issue

**Title:** docs: consolidate the BrainData tutorials into one notebook and return Tutorials to the site

## Description

Part of #505. First of the eight consolidated tutorials.

## What changes

- `docs/tutorials/data-operations/01_brain_data.py` (510 lines) replaces five notebooks: `basics/01_brain_data.py`, `data-operations/01_download.py`, `02_masking.py`, `03_brain_space.py` and `04_neurovault.py`. Seven sections: load, index and slice, arithmetic and statistics, save, plot, masks and ROIs (with a brain-space subsection), NeuroVault. Every claim was checked against the source; two examples in the old notebooks computed the wrong thing (the per-subject contrast was low minus medium, and the connectivity threshold on a correlation-distance matrix kept the pairs that do not covary) and are corrected.
- The Tutorials section returns to the nav with `docs/tutorials/index.md` (one line per tutorial, plus the v0.5.1 community links). Pages are generated from the notebooks by `scripts/marimo_to_zensical.py` for the notebooks in its `TUTORIAL_GLOBS`, which is the nav list; the remaining notebooks stay parked until their turn. Each page carries an "Open in molab" badge.
- Tutorial cells execute in the strict build against the joblib cache in `.tutorial-cache`, so a cell that raises or writes to stderr fails the build. `HF_TOKEN` is passed to the docs legs of `ci.yml` and `docs-deploy.yml` so the template and atlas downloads are not rate-limited.
- `scripts/docs_show.py` rasterizes each figure's collections at 200 dpi before serializing to SVG. Without it the flatmap alone was 122 MB of mesh paths; the page is now 4.4 MB.
- `tutorials-check` and `tutorials-run` cover the nav notebooks only.
- `BrainData.extract_roi` docstrings said "images x ROIs" for a labeled atlas; the code (and v0.5.1) return ROIs x images. Docstrings corrected.

## Not in this PR

The notebook's PEP 723 header pins `nltools>=0.6.0`, which molab cannot resolve until a release exists on PyPI (#487, #507).

## Checks

`uv run poe tutorials-check`, `uv run poe docs-build` (cold, 37 s; warm, 24 s), `uv run poe ok` (989 passed).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7e55507aebb7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.