# Issue

**Title:** neuralbench: per-epoch data cap, REVE MEG channel names, preprocessor…

## Description

… padding

- `--max-neuro-hours-per-epoch HOURS` (and `max_neuro_hours_per_epoch` in the Python API): each training epoch draws a fresh random subset of `HOURS` of training windows, so large datasets train in comparable time. Capped runs are cached separately from uncapped ones.
- `OnTheFlyPreprocessor.min_temporal_samples` right-pads short windows with zeros, for models whose patch size is fixed by a checkpoint (e.g. REVE); the model factory runs the preprocessor before the lazy-layer / output-shape probe.
- REVE channel mapping also matches Neuromag/KIT names whatever the separator (`MEG0113`, `MEG-0113`) and CTF names without the serial suffix (`MLC11-4504`).
- Runs trained with `DistributedClipLoss` get the same regression-vector plots as `ClipLoss` ones.

## What does this PR do?

<!-- Brief description of the change. -->

## Related Issues

<!-- e.g. ,  -->

## Checklist

- [ ] Tests added or updated
- [ ] Docstrings updated for any changed public APIs
- [ ] `pytest` and `mypy` pass locally

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8ada8c73910b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.