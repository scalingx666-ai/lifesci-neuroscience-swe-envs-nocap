# Issue

**Title:** Reject coordinates outside mask image bounds

## Description

.

Changes proposed in this pull request:

- Check transformed voxel indices against the mask shape before indexing the mask.
- Return `False` for coordinates outside the image volume instead of clipping them onto boundary voxels.
- Add a regression test with an out of volume focus and a true boundary voxel.

Testing:

- `python -m pytest nimare/tests/test_studyset_store.py -k points_outside_mask_volume -q`: 1 passed, 113 deselected.
- `black --check nimare/studyset/view.py nimare/tests/test_studyset_store.py`: passed.
- `isort --check-only nimare/studyset/view.py nimare/tests/test_studyset_store.py`: passed.
- `flake8 nimare/studyset/view.py nimare/tests/test_studyset_store.py`: passed.

## Summary by Sourcery

Reject coordinates outside image volumes instead of treating them as boundary-voxel coordinates.

Bug Fixes:
- Prevent out-of-volume coordinates from inheriting mask values from clipped boundary voxels.
- Ensure diagnostic and masking workflows safely handle voxel indices outside image bounds.

Enhancements:
- Add a shared voxel lookup utility that reports both retrieved values and whether indices are in bounds.

Tests:
- Add regression coverage for out-of-bounds voxel lookups and mask boundary behavior.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `872486ee47f6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.