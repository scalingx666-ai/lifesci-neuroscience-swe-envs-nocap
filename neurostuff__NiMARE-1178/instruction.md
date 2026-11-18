# Issue

**Title:** [DOC] Run the gallery examples in the browser with JupyterLite

## Description

Builds on #1177. Each gallery example page gets a **launch JupyterLite** button that opens the example as a notebook running entirely in the browser, on a xeus-python kernel in WebAssembly. Opening this PR mainly to see the Read the Docs preview build it.

Changes proposed in this pull request:

- **JupyterLite site in the docs.** jupyterlite-sphinx builds it and sphinx-gallery adds the notebooks. The new extension `docs/sphinxext/nimare_lite.py`:
  - creates the kernel environment from `docs/jupyterlite/environment.yml` and byte-compiles it. jupyterlite-xeus ships no `.pyc`, so without this the browser compiles every imported module from source on each page load. #1177 measured `import nimare` at 67 s without bytecode and 29 s with it, before lazy imports.
  - bundles the 74 pain-dataset files the pain JSON files reference (82 MB), so `download_nidm_pain()` finds them instead of downloading from NeuroVault.
  - starts each notebook with `%matplotlib inline` (the kernel's backend is Agg) and, where needed, sets `NIMARE_DATA` to the bundled data.
  - removes the button from the 11 examples that can't run in the browser: they download from NeuroVault, NeuroStore, Neurosynth, Cognitive Atlas or nilearn, or need PyTorch (CBMR), XGBoost or pyarrow. emscripten-forge's only pyarrow build traps in `read_parquet`. Their notebooks open with a note saying why.
- **Build setup.** The site is built only when `micromamba` is on PATH or on Read the Docs, so local builds without it are unchanged. `.readthedocs.yaml` installs micromamba, and the `doc` extra gains `jupyterlite-core`, `jupyterlite-sphinx>=0.23` and `jupyterlite-xeus`.
- **`m2r2>=2.1`.** jupyterlite-sphinx pulls in nbconvert, which needs mistune 3, and older m2r2 pins mistune 0.8.4. m2r2 2.1 rejected two spots in CHANGELOG.md, which are fixed here.
- **`nimare.reports` no longer forces the Agg backend.** `mpl.use("Agg", force=True)` at import switched the whole session's backend, so `plt.show()` displayed nothing in Jupyter after an example imported the reports. CI now sets `MPLBACKEND: Agg` instead. There's a new test that importing `nimare.reports.figures` leaves the backend unchanged; it fails with the old line.

Local testing (Linux, headless Chrome via Playwright):

- 20 of the 21 offline examples ran in the browser without errors. The parquet example crashed on pyarrow, which is now removed from the kernel.
- The kernel starts in about 10–15 s. Typical examples take 15–100 s. The heavy ones run about 2–3x slower than native, for example `02_plot_ibma` at 365 s against 186 s.
- I only checked that every cell finished without an error. Outputs weren't compared against native runs.
- A clean local `plot_gallery=0` build put the button on exactly the 21 supported examples.
- This hasn't been built on Read the Docs yet.

Things to check in the preview build:

- The JupyterLite step adds about 6 minutes to the docs build, on top of running the gallery. It needs about 1 GB of temporary disk space and adds 361 MB to the output.
- Open an example, e.g. `auto_examples/02_meta-analyses/01_plot_cbma`, and click **launch JupyterLite**.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Summary by Sourcery

Enable supported gallery examples to run interactively in the browser through JupyterLite while keeping documentation builds and plotting behavior compatible.

New Features:
- Add JupyterLite-powered browser execution for supported gallery examples, including bundled dependencies and pain-dataset data.
- Provide clear notices instead of launch options for examples that require unavailable downloads or native-only dependencies.

Bug Fixes:
- Preserve the active Matplotlib backend when importing report figure utilities.

Enhancements:
- Prepare browser notebooks with inline plotting and local data configuration for reliable execution.

Build:
- Add JupyterLite kernel environment setup, bytecode compilation, documentation build integration, and required documentation dependencies.
- Update documentation cleanup and Read the Docs setup to support JupyterLite builds.
- Update m2r2 and changelog formatting for compatibility with the documentation toolchain.

CI:
- Set the Agg Matplotlib backend in continuous integration tests.

Documentation:
- Expose browser-launchable notebooks from gallery example documentation pages.

Tests:
- Add coverage ensuring report imports do not alter the Matplotlib backend.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b5d866dc1a4e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.