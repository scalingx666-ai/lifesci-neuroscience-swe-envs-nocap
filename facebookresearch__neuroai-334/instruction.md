# Issue

**Title:** neuralbench: BIOT bipolar derivations after the channel adapter

## Description

Aligns BIOT's input scaling with its reference implementation, which scales each bipolar derivation after building it; NeuralBench scaled the monopolar inputs first, so the shared reference no longer cancelled. Only BIOT's experiment UIDs change.

- New `DownstreamWrapper.preprocess_after_adapter` (default `False`) runs the on-the-fly preprocessor on the channel adapter's output; `biot.yaml` sets it.
- Docstrings: per-channel `MinMaxScaler` in `OnTheFlyPreprocessor` is not BENDR's normalization; LaBraM truncates windows to whole 1 s patches.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2f28d6c43f69`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.