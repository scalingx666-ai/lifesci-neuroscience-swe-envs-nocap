# Issue

**Title:** neuralbench emg/pose: scale EMG input to microvolts

## Description

## What does this PR do?

Fixes the EMG input scale for `neuralbench emg/pose` (`VEMG2Pose`) to match the public emg2pose training setup.

`mne`/`mne-bids` expose EMG in SI volts, while public `emg2pose` trains on raw HDF5 EMG values in microvolts. At volt scale, `VEMG2Pose`'s first LayerNorm operates in the `var << eps` regime and suppresses the signal path.

This PR sets:

- `neuralbench-repo/neuralbench/tasks/emg/pose/config.yaml`
  - `data.neuro.scale_factor: 1.0e6`

and updates the surrounding comments/docs accordingly.

## Public evidence chain (code)

1. **Public emg2pose feeds raw HDF5 EMG without scaling**
   - `emg2pose/transforms.py` (`ExtractToTensor`): `torch.as_tensor(data[self.field])`
   - `emg2pose/data.py` (`WindowedEmgDataset.__getitem__`): `emg = self.transform(window)`
   - `config/transforms/rotation_augmentation.yaml`: only extraction + rotation augmentation.

2. **NeuralBench emg/pose currently uses MNE-loaded EMG values**
   - `neuralbench-repo/neuralbench/tasks/emg/pose/config.yaml` had `scaler: null` and no `scale_factor`.

3. **Model scale sensitivity point**
   - Public emg2pose network uses LayerNorm in the TDS stack (`emg2pose/networks.py`).
   - braindecode `VEMG2Pose` similarly applies LayerNorm in early conv/tds blocks.

4. **`scale_factor` is the intended mechanism and cache-safe**
   - `neuralset-repo/neuralset/extractors/neuro.py` documents `scale_factor` for V→mV/uV conversion.
   - Same file excludes `scale_factor` from extractor cache UID and applies it at read time.

## Changes in this PR

- **Config fix**
  - `neuralbench-repo/neuralbench/tasks/emg/pose/config.yaml`
    - Added `data.neuro.scale_factor: 1.0e6`
    - Clarified comments to say paper input scale is raw microvolts.

- **Docs**
  - `docs/neuralbench/tasks/emg/pose.rst`
  - `docs/neuralbench/tutorials/07_biosignal_challenge_2026/plot_track4_emg_to_pose.py`
  - Added one-sentence note that EMG is scaled V→uV (`scale_factor: 1e6`) for parity with emg2pose.

- **Test**
  - `neuralbench-repo/neuralbench/test_cli.py`
  - Added `test_emg_pose_neuro_extractor_uses_microvolt_scale` asserting resolved `data.neuro.scale_factor == 1.0e6`.

## Impact

- **Behavioral parity**: brings `emg/pose` EMG input scale in line with public emg2pose.
- **No target-scale change**: joint-angle targets remain radians (unchanged).
- **Cache impact**: none expected for prepared EMG caches because `scale_factor` is excluded from extractor cache UID and applied at read time.

## Baseline table note

This PR intentionally does **not** change the Track-4 baseline value shown in docs/tutorial tables. The published `VEMG2Pose` table entry should be re-run by maintainers (3 seeds, SLURM) after this fix.

## Follow-up (emg/typing)

`emg/typing` currently also keeps `scaler: null`. I checked the model-side normalization path: braindecode `EMG2QwertyNet` starts with spectrogram processing and an early `BatchNorm2d` stage (not the same LayerNorm pattern as `VEMG2Pose`). I did not change typing behavior in this PR; an empirical typing-scale check is a separate follow-up.

## Related Issues

N/A

## Checklist

- [x] Tests added or updated
- [ ] Docstrings updated for any changed public APIs
- [ ] `pytest` and `mypy` pass locally (not run in this environment: missing full runtime deps such as torch)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a68b7be4c137`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.