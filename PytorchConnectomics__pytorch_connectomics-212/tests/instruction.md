# Issue

**Title:** lsd: bounding-box accumulation for ~19x faster LSD target computation

## Description

LsdExtractor.get_descriptors ran ~10 full-volume gaussian_filter passes per label, costing O(#labels x patch_volume) on the dataloader critical path. Add a per-label bounding-box path (downsample==1) that crops each label to its bbox padded by ceil(TRUNCATE*sigma) — which covers the gaussian/sphere kernel's truncated support — computes descriptors on the crop, and scatters back only at in-label voxels. Equivalent to the full-volume output within float tolerance.

The original loop is preserved as _accumulate_full (used for downsample>1 and as the test oracle). find_objects locates bboxes for dense integer labels, with a per-label axis-reduction fallback for sparse/large IDs, absent explicit labels, and the float32 label arrays the MONAI transform produces.

Benchmark (128^3, 30 labels): full=60.85s -> bbox=3.19s = 19.05x.

Adds tests/unit/test_lsd.py: bbox-vs-full equivalence across components, non-unit voxel_size, 2D, empty/absent/single/border/sparse/float32/sphere, plus an opt-in (LSD_BENCH=1) timing benchmark.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9eb6ac2b6bd7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.