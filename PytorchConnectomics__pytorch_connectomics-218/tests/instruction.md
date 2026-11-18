# Issue

**Title:** j0126 tutorial: clarify native resolution and add data download script

## Description

## Summary

This PR clarifies the j0126 tutorial's data resolution and adds tooling to download the EM volume from the public mirror. The key insight is that the native FFN grid is 9 × 9 × 20 nm (x, y, z), not 10 nm isotropic as previously implied. All published results use this anisotropic native resolution.

## Key Changes

**Documentation & Configuration:**
- Corrected resolution references throughout: the `im_align_10nm.zarr` store is byte-for-byte equal to mip 0 (9 × 9 × 20 nm), not a 10 nm isotropic resample
- Simplified and reorganized [1_affinity_supervised.yaml](tutorials/neuron_j0126/1_affinity_supervised.yaml):
  - Removed 60+ lines of dense technical commentary into focused subsections
  - Clarified that the supervised reference is trained on 25 cubes (held-out 8 for validation), not all 33
  - Explicitly listed all 25 training and 8 validation cube paths instead of globbing
  - Updated resolution from `[10, 10, 10]` to `[20, 9, 9]` (ZYX native grid)
  - Corrected window/stride/divisibility explanation to match the actual [48, 96, 96] patch size

**Data Access:**
- Added [scripts/download_precompute.py](scripts/download_precompute.py): a general-purpose Neuroglancer precomputed downloader that:
  - Fetches arbitrary public precomputed layers (image or segmentation) into local zarr
  - Supports partial downloads via `--bbox` for testing
  - Handles sharded jobs with `--shard-id` / `--num-shards` for whole-volume runs
  - Includes progress tracking and resumable downloads
  - Documented with examples for both full j0126 EM (~660 GB) and test crops

**README Reorganization:**
- Moved resource budget and cleanup procedures to separate [RESOURCE.md](tutorials/neuron_j0126/RESOURCE.md) and [CLEANUP.md](tutorials/neuron_j0126/CLEANUP.md) files
- Rewrote "Step 0 — get the data" section with clear instructions for:
  - Downloading the 33 labelled cubes (395 MB)
  - Downloading the public EM volume (with sharding guidance)
  - Clarifying that mip 0 is the correct grid (not a resample)
- Updated [1_affinity_zeroshot.yaml](tutorials/neuron_j0126/1_affinity_zeroshot.yaml) comments to reference native 9 × 9 × 20 nm resolution
- Updated [params.yaml](tutorials/neuron_j0126/params.yaml) with resolution clarification

## Notable Details

- The supervised affinity train/val split is deterministic: sort 33 cube names, take every 4th starting at index 2 for validation (8 cubes, including 2 of the 4 large 128×256×256 ones)
- The released checkpoint predates this split and trained on all 33 cubes; retraining with the new config gives an honest held-out validation curve
- Window size [48, 96, 96] is near-isotropic in physical space (960 × 864 × 864 nm) despite anisotropic voxels, matching the trained model's normalization statistics
- All inference and evaluation use native mip 0; no resampling to 10 nm isotropic

https://claude.ai/code/session_014WVoz5xNr9MAkRpdGRytt7

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d0257d88c30b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.