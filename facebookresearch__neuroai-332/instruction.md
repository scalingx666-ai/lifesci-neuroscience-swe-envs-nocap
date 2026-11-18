# Issue

**Title:** neuralbench: fail without a config instead of falling back to /tmp; neuraltrain: silence import FutureWarnings

## Description

Makes NeuralBench fail clearly on cluster jobs without a config instead of writing to node-local /tmp, and silences two noisy third-party import warnings.

- Silence third-party `FutureWarning`s at import: braindecode's deprecated `standard_1020` montage name and `dalle2_pytorch`'s `torch.jit.script`, filtered by message around the two import sites only.
- First-time config setup prints `Created directory` only for directories it actually created.
- Without a config file and without a terminal (sbatch, `nohup`, CI), `load_config()` now raises a `FileNotFoundError` pointing at `NEURALBENCH_CONFIG` instead of silently using node-local `/tmp/neuralbench`.
- Tests: a session-wide autouse fixture writes a throwaway config and sets `NEURALBENCH_CONFIG`, so tests no longer read the developer's own config; `patch_config` builds on it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cb19d1e4d9e6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.