# Issue

**Title:** Stamp downsampled dataset with achieved, not requested, sampling rate

## Description

.

`spm_eeg_downsample` stored `S.fsample_new` (the requested rate) on the output object, but `ft_preproc_resample` rounds the decimation factor, so the achieved rate — already computed as `fsample_new` and used for the on-screen report — can differ. For non-integer ratios the stored rate was silently wrong (e.g. requested 180 Hz, actual ~166.7 Hz), biasing all downstream latencies and filters. This stores the computed `fsample_new` so the stamped rate matches the data.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `530ec5271b22`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.