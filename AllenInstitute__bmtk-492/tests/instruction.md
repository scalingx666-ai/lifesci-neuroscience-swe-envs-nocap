# Issue

**Title:** DPointNet: spike-exchange hooks for neuron-partitioned training; lower-memory CSR build

## Description

Spike exchanges. `DirectRecordedAdjointRunner(spike_exchanges={name: exchange})` feeds a named "spikes" input from a `SpikeExchange` instead of the replay: `forward(time, spikes)` runs before every step with the cell's previous-step spikes and returns the input's frame; `reverse(time, credit)` runs while every step is reversed with the frame's complete FP32 credit and returns the credit of the cell's previous-step spikes, which joins the recurrent history credit; `begin()` runs before the forward and (after it) before the reverse loop. Exchanged frames are recorded bit-packed, take no replay columns and their credit carries the recurrent spike-gradient scale. A network split by neurons across runners (edges from remote neurons as an exchanged input) then trains like the unsplit network; a loopback test reproduces an unsplit network's counts, states and per-edge gradients (relative L2 ~3e-8) with nonzero initial history, batch 2/3 and gradient scales 1/0.5. Without exchanges the runner is unchanged.

CSR build memory. `build_csr_connectivity` keeps integer indices/types in their width, validates integers without float copies, builds sort keys with one allocation, counts/scans in chunks, marks compact (target, type) pairs in a dense table when small and writes metadata sections directly. NEST named inputs keep int32 indices when the delayed range fits. Metadata is byte-identical (new oracle tests); on a 23M-edge recurrent rank the transient peak fell from ~110 to ~39 bytes/edge and the build from 3.4 to 1.4 s; a whole 40M-edge cell build peaks 60 instead of 91 bytes/edge above its inputs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `60e5e62f3807`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.