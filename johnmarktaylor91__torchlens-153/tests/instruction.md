# Issue

**Title:** fix(validation): tolerate small replay drift

## Description

## Summary

- Allow validation replay float comparisons to use a small absolute floor plus relative tolerance.
- Add a regression unit test for tolerated replay drift.

## Root Cause

Deep timm convolution replays can differ from saved activations by a few float32 ULPs. The previous fixed absolute threshold was too tight for the deeper ResNeXt/ECA ResNet paths, even though captured Conv2d arguments matched the live modules.

## Fix

- Use torch.allclose for tolerated replay comparisons with atol=1e-5 and rtol=1e-4.
- Keep exact equality behavior when validation calls do not opt into tolerance.

## Test Plan

- [x] ruff check . --fix
- [x] ruff format .
- [x] mypy torchlens/
- [x] pytest tests/ -m smoke -x --tb=short
- [x] pytest tests/test_real_world_models.py::test_timm_gluon_resnext101_32x4d tests/test_real_world_models.py::test_timm_ecaresnet101d -v
- [x] pytest tests/ -m "not slow" -x --tb=short

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `153083d927dc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.