# Issue

**Title:** Fix edge cases in neuroglancerPrecomputed/n5 data loading

## Description

### Summary
(AI-written)

Fixes reading layers whose size is not a multiple of the chunk size, where edge chunks are clipped to the volume bounds. It mainly targets neuroglancer-precomputed, but also fixes related N5 and big-endian problems in the no-copy shortcut.

  - **compressed_segmentation:** the decoder got the full chunk shape instead of the clipped one, so it read past the block headers and failed with `Could not decompress data chunk`
  (`ArrayIndexOutOfBoundsException`). `Compressor` now has a `decompress(input, chunkShape)` variant, and `ChunkReader` passes the per-chunk shape to it.
  - **No-copy shortcut, precomputed:** `DatasetArray` returned a chunk directly when the request matched the *full* chunk shape, so a clipped chunk came back as a whole bucket. The check now
  compares against the chunk's actual (clipped) shape. The interior-chunk case returns early without allocating.
  - **No-copy shortcut, N5:** N5 stores edge blocks clipped, which shows only after reading the block. If a shortcut read returns fewer bytes than requested, it now falls back to the copy
  path.
  - **No-copy shortcut, byte order:** the shortcut passed stored bytes through unchanged, so big-endian data (all N5, Zarr with `>` dtypes or a big-endian `bytes` codec) with ≥2 bytes per
  voxel came back byte-swapped. The shortcut is now only used for little-endian or 1-byte data. `WKWHeader` now correctly reports little-endian (it inherited big-endian), so WKW keeps using
  the shortcut.
  - **Chunk cache:** shortcut reads cache chunks as untyped flat byte arrays under the same key as typed chunks, so a later partial read of the same chunk could get the flat array and fail.
  Shortcut entries now have their own cache key. This affects all `DatasetArray`-based formats.


### Steps to test:
- Add `gs://neuroglancer-public-data/kasthuri2011/ground_truth`, view edges of coarse mags, should load without errors.
- the new tests suites


### Issues:
- 

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)
- [x] Needs datastore update after deployment

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6169c7202de6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.