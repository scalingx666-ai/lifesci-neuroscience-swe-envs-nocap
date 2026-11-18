# Issue

**Title:** fix: plotting defaults for glass brains and adjacency matrices

## Description

.

Three inherited v0.5.1 defaults that made a newcomer's first plots misleading:

- **Glass brains draw every voxel.** `BrainData.plot(method='glass')` forwarded no `threshold`, so nilearn's `threshold='auto'` hid a data percentile and dropped the colorbar's 0 tick. It now forwards 0 unless the caller asks for a cutoff.
- **Divergent adjacency matrices are anchored at zero.** `Adjacency.plot` uses `RdBu_r`, `center=0` and symmetric limits when the off-diagonal values cross zero; one-signed matrices keep the sequential default; caller keywords win.
- **The square diagonal follows `matrix_type`.** 1 for a similarity, 0 for a distance, so `distance_to_similarity()` and `Adjacency(sim.squareform())` no longer show or re-infer a zero diagonal. Arithmetic keeps `matrix_type` unchanged (`1 - d` stays a distance) and a test pins that. `to_graph` skips the unit diagonal so graphs gain no self-loops.

Migration guide: three rows under Plotting; its own glass-brain example thresholded above the data maximum and is corrected.

Checks: `uv run poe ok` (1006 passed), `uv run poe docs-build` (strict).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7dbda4d612f8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.