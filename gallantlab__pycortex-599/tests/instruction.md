# Issue

**Title:** Unify VolumeRGB and VertexRGB signatures

## Description

## Summary

- Move `color_voxels` static method from `VolumeRGB` to `DataviewRGB` base class, generalized for `VertexData`
- Add color remapping support to `VertexRGB`: `shared_range`, `shared_vmin`, `shared_vmax`, custom channel colors (`channel1color`, `channel2color`, `channel3color`), and HSV controls (`max_color_value`, `max_color_saturation`)
- Remove `**kwargs` from `DataviewRGB`, `VolumeRGB`, and `VertexRGB` `__init__` signatures — unsupported keyword arguments now raise `TypeError` instead of being silently swallowed

## Test plan

- [x] Existing tests pass (43/43, 1 unrelated failure in `test_download_subject`)
- [x] New tests for `VertexRGB` with `shared_range`
- [x] New tests for `VertexRGB` with custom channel colors
- [x] New tests for `TypeError` on unknown kwargs (both `VolumeRGB` and `VertexRGB`)
- [x] Regression tests for `VolumeRGB` `shared_range` and custom colors

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fe46c5d34f21`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.