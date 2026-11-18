# Issue

**Title:** Optimize `SpikeRetriever` and RAM usage for extensions

## Description

This PR reduces the RAM usage for computing spiek-vector extensions by:

- Only allocating `sample_index` array in `spike_vector` init (materializes for zarr, keeps as memmap -- fast -- for binary backend)
- Avoid segment slices in case of mono-segment
- Reduce dtype for spike locations and amplitude scalings from float64 to float32 (more than enough)

In addition, it also adds missing kwargs to the `PipelineNodes`

Here are some benchmarks and projections:
<img width="2116" height="683" alt="image" src="https://github.com/user-attachments/assets/d82cc024-5a23-4521-bd53-125f7626bad1" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0c9b6b915505`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.