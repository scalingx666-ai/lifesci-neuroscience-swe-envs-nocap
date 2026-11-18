# Issue

**Title:** Make the background channel optional for classification

## Description

## Summary

#352 asks for the background channel to be **optional**, so the classifier can run on the signal channel alone. This PR makes the whole classification path work with **signal only**: `background_array=None` flows from the public API to a single-channel model, and `cellfinder_train` builds a model matching the data's channel count.

The data layer already supported this (`CuboidArrayDataset` → `num_channels=1`, #493); this PR fills the plumbing around it: the entry points and model building that still assumed two channels. It is **backend only**, with no napari/GUI changes (see *Follow-ups*).

## Scope

Two-channel behaviour is unchanged, and detection is unaffected (it already runs on the signal channel only, so single-channel mode changes nothing there).

## Single-channel model

The `resnet50_1ch` registry slot is added as a **placeholder** (filename set, hash `None`); it isn't downloadable yet. A following commit (hence the initial draft) will update it with the trained single-channel model once training is complete. A model/data channel mismatch already raises a clear error.

## Feasibility (preliminary)

Quick 1-ch vs 2-ch check on the standard cellfinder training data (`serial2p`, 107,555 labelled cubes, the same set @IgorTatarnikov used), mimicking his #352 experiments (resnet9 / 2 epochs here; the faithful follow-up is a resnet50 matching his default 50-layer setup), held-out test set (10,756 cubes):

| metric    | 1-ch (signal) | 2-ch (signal+bg) |
|-----------|---------------|------------------|
| accuracy  | 0.9624        | 0.9724           |
| precision | 0.9423        | 0.9526           |
| recall    | 0.9803        | 0.9907           |
| F1        | 0.9609        | 0.9713           |
| ROC-AUC   | 0.9918        | 0.9938           |

The two initial epochs follow a similar loss/accuracy trend to his #352 curves.

## What changed

### Core API: accept a missing background
- `core/main.py`: `background_array` is now `Optional` (may be `None`); docstring documents single-channel mode.
- `core/classify/classify.py`: the `background_array.ndim != 3` guard only fires when a background is actually provided.

### Build a model that matches the channels
- `core/classify/tools.py`: `get_model` gains a `num_channels` argument and builds `shape=(50, 50, 20, num_channels)`. Defaults to `2`, so existing callers are unaffected.
- `core/classify/classify.py`: passes the dataset's `num_channels` into `get_model`, then validates the built/loaded model's input channels match the data and raises a clear `ValueError` on mismatch.

### Training
- `core/train/train_yaml.py`: `run()` derives the channel count from the data (`len(filenames_train[0])`) and builds the model to match. A YAML entry with `bg_channel: -1` already produces single-channel data; now the model is built to fit it. No new CLI flag needed.

### Model registry
- `core/download/download.py`: registers `resnet50_1ch` (`resnet50_1ch.h5`, hash `None`) in `model_filenames` / `model_hashes` / `model_type`.

### Tests
- `test_classify/test_tools.py`: `get_model` builds 1- and 2-channel models with the right input shape.
- `test_classify/test_classify.py`: a model whose channel count differs from the data raises a clear `ValueError`.
- `test_unit/test_main.py`: `main(background_array=None, ...)` reaches detection.
- `test_unit/test_download.py`: registry dicts stay consistent and `resnet50_1ch` is registered.
- `test_integration/test_train.py` + `training_single_channel.yaml`: training with `bg_channel: -1` runs and saves a model with **1** input channel.

## Testing

Verified locally (Python 3.11, `KERAS_BACKEND=torch`):

- `test_classify` suite: All pass.
- New unit tests (`test_tools`, `test_main`, `test_download`): pass.
- Single-channel + standard training integration tests: pass; the single-channel run saves a `(…, 1)`-channel model.
- `ruff check` clean on all changed files.

## Follow-ups

- **No napari/GUI support (deferred as one follow-up).** This PR is backend only. The GUI single-channel work is intentionally left as a single coherent follow-up: (a) the **detect widget** still requires a background layer, and (b) the **Curation widget** (`napari/curation.py`) demands both layers and writes `bg_channel: 1`, so single-channel training-data curation via the GUI isn't supported. The Python API and `cellfinder_train` (`bg_channel: -1`) do support single-channel.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `72925b29872e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.