# Issue

**Title:** [ENH] new "ignore_background_data" parameter in Parcellater + other minor fixes

## Description

This commit adds an `ignore_background_data` parameter and a `background_value` parameter in the `transform` method of the `Parcellater` class. These parameter are useful for when the image that we want to parcellate has background data values that should be ignored (see the discussion in Issue #66 as an example). This commit also fixes other minor bugs. The major changes are as follows:

spins.py:
- Added `background` parameter to `vertices_to_parcels` function.

parcellate.py:
- Added `ignore_background_data` and `background_value` parameter to the `transform` method of the `Parcellater` class. See their description in the docstring of the method for more information on how they work.

- Fixed a bug happening when using the `transform` method with volumetric maps and `resampling_target` of the `Parcellater` object set to `parcellation`: `NiftiLabelsMasker` was called with `resampling_target=self.resampling_target`, but this function does not accept `parcellation` as a valid resampling_target. Since the resampling happens earlier in the `transform` function, there's no need to resample the data in `NiftiLabelsMasker`, so `resampling_target` in `NiftiLabelsMasker` can be set to `None`.

- Fixed a bug happening when using the `transform` method of the `Parcellater` class with `resampling_target` set to `parcellation`: `resample_images` was always called with the `method` parameter set to `nearest`. The `nearest` method is however not appropriate when resampling a `data` image. The `method` parameter is now set to `linear` when the `data` image is resampled to the parcellation.

plotting.py:
- Fixed a bug in `plot_surf_template`:  the colorbar was wrongly placed when `colorbar` was set to `True`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b20039590654`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.