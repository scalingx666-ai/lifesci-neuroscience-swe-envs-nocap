# Issue

**Title:** Fix run_for_all_spikes units and segments after the first

## Description

### Context
I was investigating whether the L-ratio and isolation distance that SpikeInterface computes from its random-spike draw are good estimates of the textbook values (I think they are not, but that's a separate issue). In doing so, I was trying to keep the PCA fit out of the comparison, so I was fitting one PCA model and using `run_for_all_spikes` to project a whole recording's spikes, and then randomly drawing subsets of those projections. That only works if `run_for_all_spikes` reproduces the analyzer's stored `pca_projection` at the random spikes, so I checked and was surprised to find that it didn't. Further investigation revealed a pair of bugs...

### The bugs

`ComputePrincipalComponents.run_for_all_spikes` (used by `export_to_phy` to write `pc_features.npy`) had two problems:

1. `Units. _all_pc_extractor_chunk` called `get_traces(...)` without `return_in_uV`. The PCA model was fitted on waveforms extracted with the analyzer's `return_in_uV` (True by default). If a recording's gain was not 1, it was projecting unscaled traces onto a model fitted in uV.
2. `Segments. _init_work_all_pc_extractor` keeps only segment 0's spikes, but the chunk executor runs over every segment. Chunks of later segments project their traces at segment 0's spike times and overwrite segment 0's rows, and spikes of later segments stay at zero. `export_to_phy` asserts one segment, so only direct calls are affected. Probably nobody ever hit this bug.

### Fixes

- Pass the analyzer's `return_in_uV` to the worker and to `get_traces`, so traces are in the units the PCA model was fitted on.
- Keep the spike vector of all segments in the worker, with each segment's slice of it, and search only the chunk's segment.
- Have `test_compute_for_all_spikes` run on a copy of the 2-segment test recording with a gain and offset, and check that the all-spike projections at the random spikes equal the stored `pca_projection`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7be675c89d9e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.