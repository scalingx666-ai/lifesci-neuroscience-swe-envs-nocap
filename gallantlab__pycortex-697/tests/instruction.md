# Issue

**Title:** Document Freesurfer import functionality and surface-info files

## Description

## Summary
This PR adds comprehensive documentation for importing subjects from Freesurfer into pycortex and clarifies the structure and contents of surface-info files in the database.

## Key Changes

- **Added new documentation section** in `docs/database.rst` titled "Importing a subject from Freesurfer" that explains:
  - How to use `cortex.freesurfer.import_subj()` to import Freesurfer subjects
  - Which files are imported and their mappings between Freesurfer and pycortex formats
  - Coordinate system conversion details (TKR to scanner coordinates)
  - How to import flat surfaces separately using `import_flat()`
  - How to import labels and annotations using `get_label()`

- **Updated surface-info documentation** to clarify:
  - Directory name correction from `/surface_info` to `/surface-info`
  - Explanation that Freesurfer-imported files (curvature, sulcal depth, thickness) are stored here
  - Details on `.npz` file structure with `left` and `right` keys
  - Reference to `cortex.db.get_surfinfo()` for loading

- **Enhanced docstring** in `cortex/freesurfer.py` for `import_subj()` function with:
  - Detailed tables showing file mappings for anatomical volumes, surfaces, and surface info
  - Explanation of the `whitematter_surf` parameter and its default value
  - Note about negated surface info values relative to Freesurfer
  - Clarification about what is NOT imported (flat surfaces, labels, annotations)

- **Updated example filestore structure** to include newly documented files:
  - `anatomicals/aseg.nii.gz` and `anatomicals/raw_wm.nii.gz`
  - `surface-info/curvature.npz`, `surface-info/sulcaldepth.npz`, `surface-info/thickness.npz`

## Notable Details

- Documentation emphasizes that imported surfaces are in scanner coordinates, not Freesurfer's TKR coordinates, which explains apparent misalignment in `freeview`
- Surface info values are stored negated compared to Freesurfer originals
- Clear separation between what `import_subj()` handles vs. what requires separate functions (`import_flat()`, `get_label()`)

https://claude.ai/code/session_01MfbdJr73v6YSy9nFGfezGr

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0ceec8c2d0cd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.