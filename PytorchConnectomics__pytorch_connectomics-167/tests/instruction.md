# Issue

**Title:** fix inference sliding_window bug

## Description

When I first tried to launch training with our updated monai2d_worm.yaml, the run stopped immediately with a configuration error—nothing ever reached the GPU. The problem was triggered by a line like:

```
inference:
  sliding_window:
    overlap: 0.5
```
Hydra’s structured config was set up in a way that rejected that value, so setup_config crashed before training could start. After adjusting the config definitions to accept overlap: 0.5, the YAML loads cleanly and training proceeds as expected.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `03701d954604`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.