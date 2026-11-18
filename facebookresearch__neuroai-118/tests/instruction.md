# Issue

**Title:** Enable NeuralBench local-only execution through config.json

## Description

## What does this PR do?

Adds support for running NeuralBench fully locally (no SLURM) and for cleanly disabling Weights & Biases, both controlled via `~/.neuralbench/config.json`.

Verified end-to-end: with `CLUSTER=null` + blank `WANDB_HOST`, `neuralbench eeg audiovisual_stimulus` runs in-process with zero SLURM submissions and zero wandb usage; with the default config it submits to SLURM and logs to W&B on the compute node.

## Related PRs

- #98

## Checklist

- [x] Tests added or updated
- [x] Docstrings updated for any changed public APIs
- [x] `pytest` and `mypy` pass locally

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `997b0c1b609c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.