# Issue

**Title:** Release v0.2.1: fix Colormap-instance cmap argument

## Description

## Summary

- Bump `__version__` to `0.2.1`.
- Patch release covering the Colormap-instance `cmap` bug fix landed in #162 (`TypeError: unhashable type: 'ListedColormap'` when passing a matplotlib `Colormap` object as `cmap`).

## Test plan
- [x] Local pytest on `brainspace/tests/test_plotting.py` and `brainspace/tests/test_colormaps.py` (19 passed) on top of `dd6a5a8`.
- [ ] CI green.

After merge: tag `v0.2.1` from the merge commit and publish a GitHub release; the existing `tagged_release.yml` workflow then builds and updates the `latest` release artifacts.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dd6a5a82fdac`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.