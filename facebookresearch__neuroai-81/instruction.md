# Issue

**Title:** Extends ChunkEvents to Fmri and MneRaw + improve safety

## Description

Extends ChunkEvents to Fmri and MneRaw (was audio/video only), with label-safety guarantees when chunking by split, and adds a `tiling` parameter to pick between two partitioning strategies.

Changes
- `etypes.py`: `MneRaw.read` / `Fmri.read` crop to `[offset, offset+duration]` (lazy: `raw.crop` / `img.slicer`); `_split` snaps timepoints to the sample grid so sibling chunks don't drift. Dropped the `offset → raise` guards.
- `transforms/chunking.py`: rewritten `ChunkEvents` + `_Section` helper. `_build_sections` places section boundaries at the midpoint of the silence gap between same-split runs, and raises if the gap is < 1 sample (leakage). Each section is then tiled per `tiling`:
  - `"max"` (default): chunks of exactly `max_duration` + a trailing partial, dropped iff `< min_duration`. Matches main's historical direct-chunking behavior.
  - `"equal"`: uniform tiling, every chunk in `[min_duration, max_duration]`; requires `2 * min_duration <= max_duration`. Lossless — concatenation reconstructs the input event.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bd78c7a06b27`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.