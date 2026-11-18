# Issue

**Title:** Remove the deprecated mask_file argument

## Description

.

Since v3.7.0 brain maps are plotted on the voxel grid of the parcellation file, so `mask_file` has been ignored (passing it only gave a `FutureWarning`). This removes it for v3.8.0.

## Removed

- The `mask_file` argument from:
  - `analysis.power.save` and `analysis.power.multi_save`
  - `utils.plotting.plot_brain_surface`
  - `data.Data` (and the `Data.mask_file` attribute)
  - `config_api.wrappers.plot_power_maps_from_covariances`, `plot_group_ae_networks`, `plot_group_tde_hmm_networks`, `plot_group_nnmf_tde_hmm_networks` and `plot_group_tde_dynemo_networks`
- `meeg.parcellation.parcel_vector_to_voxel_grid`: use `parcel_vector_to_nifti(vector, parcellation_file).get_fdata()`.
- `utils.misc.warn_mask_file_unused`.

Nothing else in the package, examples or docs used them.

## Breaking changes

- Passing `mask_file` now raises a `TypeError`, including from a config passed to `run_pipeline`. Scripts and configs that still pass it need it removed.
- Code calling `parcel_vector_to_voxel_grid` needs to switch to `parcel_vector_to_nifti(...).get_fdata()`.

## Checks

- None of the functions above has a `mask_file` parameter, and `Data(..., mask_file=...)` raises a `TypeError`.
- `power.save` with a real parcellation file writes PNG maps (through `plot_brain_surface`) and a NIfTI map.
- `black` leaves the changed files unchanged, and no imports are left unused.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a455af3f08c5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.