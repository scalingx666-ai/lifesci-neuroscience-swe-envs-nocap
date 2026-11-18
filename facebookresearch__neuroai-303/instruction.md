# Issue

**Title:** neuralbench: preprocessing inside the model for the stream tasks, plus two fixes

## Description

Stacked on #301: the branch starts from #301's head, so its 2 commits come first in this diff; the ones from `4fe61fd` on are new. Moved here from hubertjb/neuroai#2. Draft, for discussion.

**Preprocessing inside the model**
- `OnTheFlyPreprocessor` (neuraltrain) gains `sfreq`, `notch_filter`, `filter` and `frequency`, with the extractor's names and order: bad channels, notch, band-pass, resampling, scaler, clamp. The three frequency steps act on each window's spectrum with `torch.fft`, and a frequency step without `sfreq` raises. One test.
- The Track 2 and Track 3 pages get a "Preprocessing inside the model" section. The stream tasks scale to microvolts and no further. The section shows how to put the benchmark task's scaler and clamp back per window through `downstream_model_wrapper.on_the_fly_preprocessor`, and on Track 3 the complete chain (notch, band-pass, resampling to 120 Hz, scaler, clamp). It also covers REVE's per-recording scaler and how the stock EEGNet takes the wrapper.
- The submission guide says that preprocessing done this way carries over to `submission.py`.

**Model**
- `models/eegnex.yaml`: `-m eegnex` runs braindecode's EEGNeX, set up like `models/eegnet.yaml`.

**Fixes**
- `Experiment.fit` resets the metrics after the pre-training validation. Lightning runs `trainer.validate` in inference mode and resets the logged metrics there, so their states become inference tensors. The validation inside `fit` runs under `no_grad`, and `MeanSquaredError` then fails on its in-place update (`RuntimeError: Inplace update to inference tensor outside InferenceMode is not allowed`). With `validate_before_training` on (the default), every task with an RMSE metric stopped after its first epoch, `neuralbench eeg _sleep_onset_stream -m eegnet` included (Lightning 2.6.6, torchmetrics 1.9.0). Classification metrics reassign their states and were not affected.
- The two Muse split configs get `test_split_query: null`, a required field of `PredefinedSplit`; without it the Muse task config fails validation. These are the review suggestions on #301.

**Checks** (CPU Jobs on SDSC Voyager)
- ruff 0.15.8, the CI version: lint and format clean. `test_preprocessor.py`: 20 passed. `test_modules.py -k preprocessor` and `test_experiment_config.py -k stream_task_diff`: passed.
- `_sleep_onset_stream` debug runs with default settings, with `-m eegnet` and with a model passed to `evaluate_model`: they crash before the fix, and train and test after it.
- Real data, EEGNet trained with each recipe. On PROTEUS (3 seeds): raw microvolts, per-window scaling through the wrapper on the stock EEGNet, and the complete chain from the recorded 500 Hz (through `evaluate_model`, with EEGNet's max-norm constraints removed, see below). On Muse (1 seed): raw microvolts, the chain without resampling through the wrapper on the stock EEGNet, and the complete chain with resampling to 120 Hz. All run end to end.

**Found, not changed here**
- `evaluate_model` cannot take a braindecode EEGNet instance: it pickles the model, and PyTorch refuses modules whose max-norm constraints are parametrizations.
- An `evaluate_model` override of `seed` gives every experiment of the seed grid the same config, which exca refuses as duplicates.

**Limits**
- The notch and band-pass are masks on each window's spectrum: exact on its frequency bins, with ringing between them.
- Resampling changes the number of samples, so the model must accept the new length; NeuralBench builds config-defined models for the extractor's length.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b008d7a576d1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.