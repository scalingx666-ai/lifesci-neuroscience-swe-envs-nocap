# Issue

**Title:** Add get_default_dataloaders for loading a task's data standalone

## Description

## What does this PR do?

Adds a `get_default_dataloaders` utility that returns the train/val/test
DataLoaders for a given device and task, using the same default configs as the
benchmarks:

    from neuralbench import get_default_dataloaders
    loaders = get_default_dataloaders(device="eeg", task="audiovisual_stimulus")

The idea is to train and validate models on benchmark data without inheriting
the training surroundings (model factory, Lightning module, trainer, W&B). I've
kept it minimal: it performs the same base-defaults -> task-config merge the CLI
does, then runs `Data.prepare()` on the merged `data:` subtree. Extra `data:`
keys can be passed as dotted-path overrides, e.g.
`get_default_dataloaders("eeg", "audiovisual_stimulus", batch_size=8)`.

## Tests

The last commit tests it against `eeg/audiovisual_stimulus` (Mne2013SampleEeg,
downloaded on first run). The reference builds the same loaders the long way
through the explicit neuralset API -- bare study -> `SklearnSplit` -> extractors
-> `Segmenter` -- so the two paths share no code, then asserts equal split sizes
and element-wise equal tensors on the unshuffled test split. It doubles as a
usage example.

## Related Issues

Addresses #184

## Checklist

- [x] Tests added or updated
- [ ] Docstrings updated for any changed public APIs
- [ ] `pytest` and `mypy` pass locally

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `af8ce00c38aa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.