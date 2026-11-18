# Issue

**Title:** feat: make nltools installable and usable under Pyodide

## Description

Part of #487, the library half. After this, `micropip.install("nltools==0.6.0.dev0")` resolves under Pyodide 314 and template and atlas fetches work in the browser. The docs half (zensical `pyodide` fences and "Try it" blocks on the tutorials) follows #505.

## What changes

- **polars floor 1.42.1 → 1.33.1**, the version Pyodide 314 bundles. The three `pl.concat(how="horizontal_extend")` sites concatenate equal-height frames, where the pre-1.42 `horizontal` spelling is identical; `nltools.utils._HORIZONTAL_CONCAT` picks the name the installed polars accepts. The version parse handles pre-release strings such as `1.36.0-beta.2`.
- **h5py floor 3.15 → 3.13**, likewise; every h5py API nltools calls has existed since 3.0. h5py stays a core dependency as in v0.5.1.
- **A direct-GET fetch path under Pyodide** in `nltools/templates/fetch.py`. `hf_hub_download` HEAD-probes and both Pyodide HTTP backends crash on the bodiless response, so in the browser `fetch_resource` downloads with `pyodide.http.pyfetch` into an IndexedDB-backed cache that survives reloads, bridged to the synchronous signature with `pyodide.ffi.run_sync`. Without JavaScript Promise Integration it falls back to a synchronous `requests.get` into the session cache. Downloads write to a `.part` file and move into place. `list_resources` works in the browser once `httpcore` is installed; the docstring says so. No user-facing name changes.
- **A node smoke runner** at `nltools/tests/pyodide/` behind `uv run poe test-pyodide`: builds the wheel, resolves it with micropip against Pyodide 314.0.6 with dependencies on, and exercises the data classes and the fetch path (16 checks). Deliberately outside `poe ok` and CI; a row in `development/release-verification.md` says when to run it. Its `node_modules` are excluded from the sdist.
- **`release.yml`** marks `.dev`, `a`, `b` and `rc` tags as GitHub pre-releases.

## Not in this PR

Publishing `0.6.0.dev0`: the version is already in `pyproject.toml` and `scripts/release.py` accepts `.devN`, so a `v0.6.0.dev0` tag after this merges publishes it through the existing workflow.

The `requests` fallback runs only on a browser main thread; under node urllib3's Emscripten backend refuses synchronous requests, so it is implemented but not exercised by the runner. The runner asserts `can_run_sync()` so the primary path cannot regress onto it unnoticed.

## Checks

`uv run poe ok` (1000 passed), `uv run poe docs-build`, focused slow tests (270 passed), `uv run poe test-pyodide` (16/16), the focused tests re-run with polars 1.33.1 and h5py 3.13 installed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `24b209f9bce9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.