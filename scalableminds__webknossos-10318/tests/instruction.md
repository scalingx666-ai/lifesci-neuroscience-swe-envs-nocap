# Issue

**Title:** Pre-bundle worker-only deps in Vite dev server

## Description

### Summary
Fixes the occasional `Failed to fetch dynamically imported module: .../node_modules/.vite/deps/lz4-wasm.js?v=...` error when opening a dataset or annotation in dev mode (typically after a branch switch).

Vite's dependency scanner does not follow the `?worker` glob in `comlink_wrapper.ts`, so deps used only by workers (`lz4-wasm`, `pako`, `base64-js`) were discovered at runtime. The resulting re-optimization changes the dep hash, so the URL that was just served to the worker returns 504. Vite would normally trigger a page reload, but HMR is disabled by default and workers can't receive that message anyway.

The fix adds the worker files to `optimizeDeps.entries` so these deps are pre-bundled on startup. This only affects the dev server.

### Steps to test:
- Start the dev server with a fresh dep cache (`yarn vite --force`, or delete `node_modules/.vite`)
- Open a dataset/annotation right away → no "Failed to fetch dynamically imported module" error, and the Vite log shows no `dependency optimized: lz4-wasm … reloading`

------
- [x] Removed dev-only changes like prints and application.conf edits

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8316f2195387`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.