# Issue

**Title:** BUG: Preserve earlier .npy text in NumPy sidecar paths

## Description

## Problem

The NumPy image reader and writer derive their JSON sidecar with `filename.replace(".npy", ".json")`. That changes every occurrence, including parent directories and earlier parts of the filename. For example, `directory.npy/image.npy.copy.npy` uses `directory.json/image.json.copy.json` instead of the adjacent metadata file. Writing can fail after saving the array, and reading can miss correctly named metadata.

## Changes

- Write JSON by replacing only the terminal extension.
- Read the adjacent sidecar first, falling back to the previous globally rewritten path only when the adjacent sidecar is absent. This preserves geometry for existing files written with the old naming behavior.
- Add synthetic scalar/vector round trips for ordinary paths and paths containing earlier `.npy` text.
- Check sidecar location, voxel values, origin, spacing, direction, components, and dtype.
- Test canonical precedence over invalid legacy metadata, legacy-only reads, and missing-sidecar defaults.

## Testing

The final regression suite reproduced six failing round-trip subcases plus the independent canonical-reader failure against unmodified production source. Legacy-only and no-sidecar checks passed at baseline. After the change:

- Focused regressions: 4 tests and 12 subtests passed.
- Entire image I/O module: 13 tests and 12 subtests passed.
- Python compilation, `git diff --check`, and patch application on a clean pinned worktree passed.

These runs used Linux x86_64/Python 3.12, the checkout's Python modules, and the installed antspyx 0.6.3 native extension. A native build of the current source and the full platform matrix have not been run.

The metadata format and ordinary filenames are unchanged. If both sidecar locations exist, the adjacent terminal-suffix sidecar takes precedence. When neither exists, the reader retains its existing defaults.

Validation results above are from the reviewed Linux preparation at the unchanged base revision. Those checks were reused during submission preparation; no fresh native-source build or platform-matrix result is claimed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `61a8f2aba45a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.