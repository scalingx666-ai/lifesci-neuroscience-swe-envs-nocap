# Issue

**Title:** Accept mne raw input for spikes extractor when not NWB

## Description

## What does this PR do?

Extends SpikesExtractor so spike data can come from an mne.io.RawArray (pre-binned continuous data), not only from NWB/HDF5 files.

NWB/HDF5 path (unchanged): event.read() returns h5py.File → spike times are binned via _bin_spikes.
MNE path (new): event.read() returns mne.io.RawArray → data is taken with raw.get_data(), channel names from raw.ch_names, and resampled to the target frequency when raw.info["sfreq"] differs from the extractor’s frequency.

This supports datasets where spikes are already represented as binned continuous data (e.g. via SpecialLoader), while keeping the existing NWB binning workflow.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `02bd64b93d5b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.