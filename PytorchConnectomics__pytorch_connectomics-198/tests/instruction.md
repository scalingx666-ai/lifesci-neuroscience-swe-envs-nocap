# Issue

**Title:** Fiber segmentation fixes

## Description

Optuna tuner: Fixed per-volume evaluation (no more instance ID collisions), filtered out postprocessing params from decode kwargs, and added precision/recall logging.
Debug utils: Added torch.uint16 support to prevent dtype-related crashes.
Inference & Lightning model: Added null-checks for decoding/eval configs and robust handling of AdaptedRandError dict output.
Scheduler: Added CosineAnnealingWarmRestarts support (config + build).
Dataset: Lowered foreground_threshold from 5% to 1% for sparse fiber data, improving patch sampling.
Config: Made TuneOutputConfig.output_dir optional to fix OmegaConf validation errors.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ca70e08582b0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.