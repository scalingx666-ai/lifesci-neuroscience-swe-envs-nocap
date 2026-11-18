# Issue

**Title:** nerl: pass resolution into ERLGraph edge lengths

## Description

## Summary
- The `.pkl` skeleton path was dropping `resolution` on the floor: `compute_nerl_score_details` accepted it but only used it for the `.npz` branch (`erl_graph.get_nodes_position`). For `.pkl` inputs, edges were computed via `np.linalg.norm` on voxel-unit `index_position`, so `em_erl` scored ERL in voxel units instead of nm.
- On NISB-base with anisotropic 9:9:20 voxels this gives ~0.7% relative drift vs banis `funlib.evaluate` (0.500544 voxel vs 0.503951 nm).

## Fix
- Plumb `resolution` through `networkx_skeleton_to_erl_graph` + `load_nerl_graph` so edge lengths are computed in physical units when `resolution` is set.
- `node_coords_zyx` itself stays in voxel indices for `compute_segment_lut`.
- Cache keyed on resolution (`.erl_cache.res9_9_20.npz` vs `.erl_cache.vox.npz`) so old voxel-unit caches are not silently reused.

## Verification (seed101 / step=00200000)
- `voxel : 0.500544` (bit-identical to existing TSV)
- `nm xyz: 0.503950` (matches banis `funlib.evaluate` 0.503951 to 1e-6; residual = float32 `edge_len` storage)

## Test plan
- [ ] Re-evaluate NISB-base run with `resolution=[9,9,20]` and confirm new `nm` cache matches `funlib.evaluate`.
- [ ] Confirm old voxel-unit cache files are not picked up under the new key.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4a68b05ad62a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.