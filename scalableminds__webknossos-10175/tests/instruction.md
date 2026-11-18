# Issue

**Title:** Fix Zarr streaming of volume annotations with additional axes

## Description

### Summary
Zarr streaming of volume annotations whose tracing has additional axes (e.g. a singleton `t` axis inherited from the dataset) returned only zeros.

**Root cause:** the tracingstore's `.zarray` and `datasource-properties.json` for a volume tracing left out the additional axes and described a 4-D array (`c, x, y, z`). Clients therefore requested 4-part chunk keys, but `rawZarrCube` expects keys that include the additional axes, so it rejected them with a 404. Zarr clients treat a 404 as a missing chunk and fill it with zeros. As a result, annotation exports came out all zeros, e.g. the voxelytics `export_tiff` job, which reads annotations through webknossos-libs Zarr streaming.

**Changes:**
- Added shared `ZarrHeader.forArray` / `Zarr3ArrayHeader.forArray`, used by both the datastore layers and the tracingstore's `zArray` / `zarrJsonForMag`. Additional axes are sorted by index (the order `ZarrCoordinatesParser` expects), with chunk size 1.
- `zarrSource` now includes the tracing's additional axes and the matching axis order (`cAdditionalxyz`).
- The tracing's group `zarr.json` now uses the tracing's own axes instead of the union over the dataset's layers.
- **zarr3 shape fix:** `zarr.json` sized additional axes as `highestValue` (upper bound − 1), so a `t: [0, 1]` axis had size 0. It now uses the exclusive upper bound. This affected the datastore's and tracingstore's `zarr.json` and the zarr3 annotation download.
- The datastore's `.zarray` for datasets already included additional axes, but now sorts them by index like the chunk key parser.

### Steps to test:
- Added `ZarrStreamingAdditionalAxesTestSuite`. It covers zarr2/zarr3 headers with a singleton axis and with out-of-order axes, and checks that chunk keys matching the header's rank are parsed by `ZarrCoordinatesParser`.
- `sbt compile`, `Test/compile` and all backend unit tests (`testOnly backend.*`, 659 tests) pass.
- **Not verified live.** Manual check: open a volume annotation on a dataset with a `t` axis and stream it via `/data/annotations/zarr/<id>/<layer>/1/.zarray` (and `zarr3/.../zarr.json`). The shape should include the `t` axis, and reading it with webknossos-libs / tensorstore should return the annotated data instead of zeros.

------
- [x] Added changelog entry
- [x] Removed dev-only changes like prints and application.conf edits

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `40fe050fef57`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.