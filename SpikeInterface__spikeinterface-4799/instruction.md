# Issue

**Title:** Fix: frame slicing after resample/decimation

## Description

Decimate/Resampling were not setting/propagating the `sampling_frequency` times kwargs at the segment level.

When frame slicing the resampled/decimated recording, this resulted in a bug because the `frame_slice` does not (on purpose) copy the `time_vector`, resulting in nor the `sampling_frequency` nor the `time_vector` being defined.

This PR simply propagates the target resample/decimated rate to the segment kwargs metadata

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2ca9a1892566`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.