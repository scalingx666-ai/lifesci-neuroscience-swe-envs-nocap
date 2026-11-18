# Issue

**Title:** Keep resampled epochs to the window's length so subjects recorded at different sampling rates can be stacked

## Description

Paradigms resample the epochs (epoching -> crop -> `epochs.resample`), and MNE gives `round(n_times * new_sfreq / native_sfreq)` samples. The resampled length therefore depends on the native rate: at `resample=200`, a 0-3 s epoch recorded at 160 Hz (481 samples) gives 601 samples, but one recorded at 128 Hz (385 samples) gives 602, the last at 3.005 s, after `tmax`. Subjects of one dataset recorded at different rates could not be stacked: `get_data` over several subjects and `CrossSubjectEvaluation` stopped in `np.concatenate` ("the array at index 0 has size 602 and the array at index 1 has size 601"). The MOABB benchmark rerun hit it with PhysionetMI subjects 88, 92 and 100 (#1280 now resamples them in the loader, but any dataset or `LocalBIDSDataset` with mixed rates has the same problem).

For an epoch of N + 1 samples at the target rate, MNE returns N + round(new / native) samples: one sample after `tmax` when upsampling by more than 1.5x, one short when downsampling by 2x or more (769 samples at 256 Hz give 384 at 128 Hz, 751 at 250 Hz give 385).

Changes
- `get_resample_pipeline(sfreq, tmin=None, tmax=None)`: given the epoch window, resampled epochs keep at most `round(tmax * sfreq) - round(tmin * sfreq) + 1` samples, the number `mne.Epochs` gives for that window at `sfreq` (601 for 0-3 s at 200 Hz); samples resampling placed after the window are dropped. The trim is by index: cropping by time is ambiguous when the first sample lies half a sample off the 1/sfreq grid (e.g. `tmin=0.0625` s, 128 -> 200 Hz). Raws are only resampled; without a window the step is unchanged. The paradigms pass their window.
- `get_data`: when the recordings of one call still differ (downsampling by 2x or more gives one sample less), all epochs are cut to the shortest length, with a warning. Nothing is padded; these calls raised before.
- Single-rate data are bit-identical unless resampling placed samples after `tmax` (e.g. 128 -> 200 Hz: 602 -> 601, the first 601 unchanged); checked for 160 -> 200, 250 -> 128, 512 -> 128 and an unchanged rate, arrays and epochs.
- The resample step's repr is part of the cache key, so epochs and arrays cached before this change are recomputed instead of read back with 602 samples.

Tests (synthetic data, no download)
- New `moabb/tests/test_resample_epoch_length.py`: 128+160 -> 200 Hz, 160+250 -> 128 Hz, 250+256 -> 128 Hz and 128+1000 -> 200 Hz stack with equal `n_times` (arrays and epochs) and keep each subject's samples; single-rate output bit-identical to the previous step; baseline outside the window; FilterBank; a window off the target sample grid; `CrossSubjectEvaluation` over 128/160/160 Hz subjects; a cache written by the previous step is not reused.
- `test_preprocessing.py`: the step at four window offsets (incl. the half-sample one), epochs already inside the window untouched, Raw only resampled, cache key changed, picklable.
- On develop the new module fails 13 of 23 tests (the 10 controls without a mismatch pass); with the change all pass, as do `test_paradigms.py`, `test_preprocessing.py`, `test_evaluations.py`, `test_splits.py`, `test_benchmark.py` and `test_physionetmi_sfreq.py`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ed1aacdb39a4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.