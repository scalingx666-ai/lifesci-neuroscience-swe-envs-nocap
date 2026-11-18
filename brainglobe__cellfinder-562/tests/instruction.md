# Issue

**Title:** Remove pytest xfail markers and pin napari to >0.6.5

## Description

Also addresses a napari deprecation warning

There are some remaining, unrelated xfails left in [tests/core/test_unit/test_detect/test_filters/test_volume_filters/test_connected_components_labelling.py](https://github.com/brainglobe/cellfinder/blob/9e47d7c050c0d98ff951e3bd7624ff8dad49afba/tests/core/test_unit/test_detect/test_filters/test_volume_filters/test_connected_components_labelling.py), but TBH I don't really understand what they are for!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9e47d7c050c0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.