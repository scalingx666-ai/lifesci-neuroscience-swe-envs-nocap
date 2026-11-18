# Issue

**Title:** Optimize find_decision_points in agglomeration pipeline.

## Description

Optimize find_decision_points in agglomeration pipeline.

We optimized the decision point identification code to resolve slowness in the pipeline. The main bottlenecks were CPU-bound Python operations on large 3D arrays in a subvolume.

Bottlenecks and Fixes:
- **Vectorized Relabeling**: Replaced the dict-based list comprehension in `relabel` (connectomics/segmentation/labels.py) with a vectorized implementation using `np.searchsorted`. This reduced the final relabeling time for a 12.5M voxel subvolume from ~16.7s to ~0.2s (78x speedup).
- **Slicing Optimization**: Replaced `ndimage.shift` and `np.roll` with NumPy slicing views in the neighbor-checking loop (ffn/utils/decision_point.py), reducing loop time from ~2.1s to ~1.1s and avoiding memory copying.
- **DataFrame Aggregation**: Collected NumPy arrays in lists and created a single DataFrame at the end of the loop, reducing pandas overhead.

Overall performance for `find_decision_points` on a representative dummy subvolume improved from **26.83s to 7.85s (3.4x speedup)**.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `187860a4fe62`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.