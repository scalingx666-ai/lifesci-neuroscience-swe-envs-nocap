# Issue

**Title:** Optimize FFN segmentation loading and cleanup for empty and dense subvolumes.

## Description

Optimize FFN segmentation loading and cleanup for empty and dense subvolumes.

In large-scale sparse pipelines (like whole-brain agglomeration), many subvolumes are empty (contain only background). Running the full connected components and size filtering (clean_up) on these empty arrays is wasteful.

This CL introduces three optimizations with safe corner-case handling:
1. **Early exit in `load_segmentation`**: If the loaded segmentation from NPZ is empty, we return early. This avoids a 512MB allocation/cast (`astype(np.uint64)`) and avoids calling `clean_up` entirely.
2. **Empty Block Fast Path in `clean_up` / `clean_up_and_count`**: Checks if the array is empty using `np.any` (takes ~50ms instead of ~1.7s on 400x400x400 empty array). If empty, returns early with properly typed mappings (handling zero-sized arrays as well).
3. **Linear-time Size Filtering (`clear_dust`)**: For non-empty integer blocks, if the max segment ID is small (< 10M, which is typical for local subvolume IDs before global relabeling), replaces `np.unique` (which sorts 64M elements) with `np.bincount` and lookup-table indexing matching `data.dtype` to avoid memory expansion. This yields up to **17x speedup for dense blocks** (from ~3.0s to ~0.17s for 90% density). Properly supports all integer dtypes (including uint8/uint16 without overflow) and signed arrays (including negative segment IDs without positive max), with graceful fallback to `np.unique` for non-integer arrays.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c4e3e5c0f4d0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.