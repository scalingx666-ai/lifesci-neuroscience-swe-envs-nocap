# Issue

**Title:** scripts: add streaming cloud-capable HDF5->precomputed converter

## Description

## Summary
- Add `scripts/h5_to_precomputed_cloud.py` for converting large, multi-channel HDF5 volumes to Neuroglancer precomputed on any CloudVolume backend (`file://`, `gs://`, `s3://`).
- Complements existing `scripts/h5_to_precomputed.py` for volumes that exceed RAM or need cloud output.

## Details
- Reads in z-slabs so volumes larger than RAM can be converted.
- Explicit source axis order via `--src-axes` (permutation of `cxyz`/`xyz`).
- Optional `--reverse-channels` (e.g. zyx-affinity → xyz-affinity).
- dtype conversion (float32, or uint8 scaled from `[0,1]`).
- Offset-aware, chunk-aligned writes with gzip-compressed chunks.

## Test plan
- [ ] Run on a small HDF5 image with `file://` backend and verify Neuroglancer can open the precomputed layer.
- [ ] Run on a multi-channel affinity volume with `--reverse-channels`.
- [ ] Spot-check chunk alignment + offset on a non-zero-origin volume.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4a68b05ad62a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.