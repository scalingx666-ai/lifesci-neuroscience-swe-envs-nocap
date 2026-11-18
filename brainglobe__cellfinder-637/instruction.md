# Issue

**Title:** Make the background channel optional in the napari plugin

## Description

Follow-up to the core single-channel support (#619), extending it through the napari UI so users can run detection, curation, and training with only a signal channel. Also  by auto-selecting the single-channel model in the Python API.

### What changed
- **Detection** (`detect.py`): the background image is now optional. A missing background is passed to core as `None`. Added a guard: running without a background requires a single-channel model, so the widget prompts the user to enable "Skip classification" or uncheck "Use pre-trained weights" and pick a single-channel model.
- **Curation** (`curation.py`): background layer is optional throughout. When absent, only the signal channel is written, and the training YAML marks `bg_channel = -1` (which core training already reads as signal-only). Signal/background selections reset cleanly to `None` when deselected.
- **Core classify** (`classify.py`): skips background normalization when there is no background array.
- **Core model selection** (`main.py`): when `background_array` is `None` and the default multi-channel model is still selected, the API switches to `resnet50_1ch`, avoiding a dimension mismatch (#636). An explicitly chosen model is left untouched.
- **Containers**: `DataInputs.background_array` is now `Optional`.

### Tests
- Save single-channel training data produces single-channel cubes and a `bg_channel: -1` YAML, verified consumable by core training.
- `check_image_data_for_extraction` accepts signal-only; missing-signal message updated.
- Deselecting the background resets the layer.
- `DataInputs(background_array=None)` passthrough and single-channel detection worker smoke test.
- Missing background auto-selects `resnet50_1ch`; an explicit `resnet50_all` is preserved.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `22f96a4eec47`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.