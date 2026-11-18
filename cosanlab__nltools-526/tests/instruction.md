# Issue

**Title:** docs: render the interactive viewer inside the live quickstart cells

## Description

Part of #487.

- `docs/_static/pyodide-output.js` renders an anywidget result: it snapshots the widget's synced traits into a plain object, injects its CSS, loads its ES module through a Blob URL and calls `render` with a model shim (`get`, `set`, `on`, `off`, a no-op `save_changes`) so the viewer's slider works locally. A widget's teardown is held per output element and run on the next Run so repeated runs do not strand WebGL contexts. The snapshot is one-way; nothing in `iplot` needs Python to react.
- The quickstart gains one cell after the mean plot: `data.mean().iplot(threshold="95%")`, with a two-sentence lead-in.
- `scripts/docs_show.py` renders a widget result at build time as `Interactive viewer (needs a live kernel)`; before this it baked the object's memory address into both the quickstart and the BrainData tutorial.

Verified in headless Chromium against the published `nltools==0.6.0.dev0` with no WebGL flags: one canvas, two range sliders, a real drag rewindows the render, no console errors, every esm.sh request succeeded. Cell timings: Pyodide plus install 13 s, the viewer cell 2 s.

Checks: `uv run poe tutorials-check`, `uv run poe docs-build` (strict, 40 s), `uv run poe ok` (1001 passed).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dd2ced6b79b8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.