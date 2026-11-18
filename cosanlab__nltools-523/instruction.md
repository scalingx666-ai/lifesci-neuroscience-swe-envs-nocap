# Issue

**Title:** docs: add a live browser quickstart sourced from a marimo notebook

## Description

Part of #487, the docs half: a quickstart that runs nltools in the reader's browser. It doubles as a ten-minute introduction that links to the three tutorials for depth.

## What changes

- **`docs/quickstart.py`**, a marimo notebook, is the page source and the file molab opens. Eighteen code cells under Basics (BrainData, DesignMatrix, Adjacency), Common analysis workflows (mapping with a GLM at first and second level; predicting with a cross-validated ridge encoding model and a held-out performance map; patterns with RSA and a two-class decode; intersubject similarity with ISC and ISRSA; aligning with Procrustes), and Keep learning. Everything runs on simulated data at 3 mm, every cell in seconds; permutation and bootstrap counts are 200 and the page says so.
- **Live cells with baked outputs.** `scripts/marimo_to_zensical.py` gains a live mode: each code cell renders as a `pyodide` fence preceded by a hidden build-time twin executed through `docs_show.py`. `docs/_static/pyodide-output.js` moves the baked output into the fence on load and clears it on the first Run, so the page reads complete before anyone clicks and becomes an editor when they do. The strict build executes the notebook, so a broken cell fails CI. The hook keeps zensical's own runtime, editor and lazy boot and adds figure and HTML rendering (nltools plots close their figures, so a `Figure`-valued result renders too).
- **`zensical.toml`** enables the `pyodide` markdown-exec language; "Quickstart" sits after Home in the nav. The generated `docs/quickstart.md` is a build artifact and is gitignored.
- **Converter fix:** zensical builds every page in one process, so a page's `set_brainspace` call leaked into the next page's cells. Every page's setup cell now resets the brain space first.

## Verified

In Chromium via playwright-cli against `zensical serve` and the published `nltools==0.6.0.dev0`: boot plus install about 12 s, all eighteen fences show their baked output on load, all eighteen run live in order with outputs matching the build, no console errors. The three templates the plots need arrive through the direct-GET fetch path from #518 and are served from the IndexedDB cache on reload.

## Noted, not changed

`nltools.algorithms.isc` returns `p` as a length-1 array for 2-D input while its docstring promises a float.

## Checks

`uv run poe tutorials-check`, `uv run poe docs-build` (strict, 37 s, four pages executed), `uv run poe ok` (1001 passed).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `26b3a7b087e6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.