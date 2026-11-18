# Issue

**Title:** Fix #195: migrate augmentation presets to current Hydra schema

## Description

## Summary
- migrate all augmentation preset YAMLs under tutorials/presets/aug_*.yaml from legacy flat keys to the current structured Hydra config schema
- update preset docs examples to the new augmentation configuration style
- add a regression test to ensure all augmentation presets load successfully
- keep motion-blur sections flexible (Any) so preset range values like [1, 3] remain supported

## Why
Issue #195 reports omegaconf.errors.ConfigKeyError when loading tutorials/presets/aug_instance.yaml due to legacy keys such as system.num_gpus.

## Validation
- conda run -n pytc pytest -q tests/unit/test_augmentation_presets.py
- conda run -n pytc pytest -q
- conda run -n pytc python scripts/main.py --demo

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4a9de34b2111`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.