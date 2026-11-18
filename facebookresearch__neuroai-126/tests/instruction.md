# Issue

**Title:** NeuralBench prediction logging

## Description

## Prediction logging for NeuralBench

Adds an opt-in way to persist **raw per-window test predictions and targets**, so any metric, error analysis, or retrieval study can be recomputed offline without re-running the model.

### What's new

- **`Experiment.save_test_predictions`** (default `False`): when enabled, a new **`WindowPredictionCollector`** callback streams the per-window `(y_pred, y_true)` from the test loop to the experiment's uid folder via an `exca` `CacheDict`, alongside a small per-window metadata table (`timeline`, `batch_idx`, `dataloader_idx`, and—when available—`subject_id` and a retrieval `group` label).
- **`Experiment.test_predictions()`**: a read-only accessor that returns `{"metadata", "y_true", "y_pred"}`, reading straight from disk so results survive cache hits.
- **Docs**: a new tutorial (`docs/neuralbench/tutorials/05_advanced/save_test_predictions.py`) covering how to enable logging, what gets saved, reading predictions back, recomputing a metric offline, and the caveats.

### Design notes

- **Memory-safe writes.** Arrays are appended to a shared memmap one batch at a time, so the write path is O(batch) rather than O(test-set)—important for high-dimensional outputs (word/video embeddings, fMRI voxels, CTC log-probs). Reading back concatenates the chunks into full arrays in RAM (documented).
- **Task-agnostic.** `y_pred`/`y_true` are stored with their native shape; no per-task aggregation. The retrieval *set* isn't stored separately—`y_true` + the `group` column are enough to reconstruct it.
- **Multi-GPU.** The test loop is single-device by construction (runs on global rank 0 with `devices=1` after the training process group is torn down), so saved predictions cover the full test set even after multi-GPU training.

### Implementation

- Saving lives entirely in the callback; `Experiment` just wires it up in `setup_trainer` and exposes the single `test_predictions()` accessor (no extra plumbing in `run()` or the aggregator).
- Tests: consolidated callback streaming/rank-skip tests and an `Experiment` round-trip + error-path test.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `79b4ca6ff857`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.