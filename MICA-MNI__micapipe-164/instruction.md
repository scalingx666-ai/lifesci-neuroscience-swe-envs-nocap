# Issue

**Title:** Complete MNI atlas update: Replace MNI152 0.8mm with MNI NLIN SYM 09a 1mm

## Description

## Summary

This PR completes the update from the MNI152 0.8mm linear asymmetric atlas to the MNI NLIN SYM 09a 1x1x1mm non-linear symmetric atlas, as specified in Issue #153. This change improves LAMAReg compatibility and enhances transformation accuracy throughout the micapipe structural processing pipeline.

## Changes

### Atlas Integration
The primary atlas for structural registration has been updated to use:
- `mni_icbm152_t1_tal_nlin_sym_09a_brain.nii.gz` (1mm isotropic, non-linear symmetric)

All atlas files are present in `MNI152Volumes/`:
- Full atlas: `mni_icbm152_t1_tal_nlin_sym_09a.nii.gz` (15M)
- Brain-extracted: `mni_icbm152_t1_tal_nlin_sym_09a_brain.nii.gz` (3.7M)
- Brain mask: `mni_icbm152_t1_tal_nlin_sym_09a_mask.nii.gz` (94K)

### Code Updates

**functions/utilities.sh** (lines 77-80, 549-599)
- Updated export variables to point to new atlas paths
- Fixed JSON transformation keys:
  - `"MNI152_0p8mm"` → `"MNI152_1mm_nlinSym"`
  - `"from-t1nativepro_to-MNI152_0p8mm"` → `"from-t1nativepro_to-MNI152_1mm_nlinSym"`
  - Added `"from-MNI152_1mm_nlinSym_to-t1nativepro"`
- Corrected string substitutions from `/0.8mm/2mm` to `/1mm_nlinSym/2mm`

**functions/QC.sh** (lines 201-216)
- Updated comment to reflect "1mm NLIN SYM 09a" atlas
- Changed loop from `for mm in 2 0.8` to `for mm in 2 1`
- Added conditional logic to handle different atlas paths for 1mm vs 2mm registrations

**functions/QC.py** (lines 418-421)
- Updated quality control output paths to use `MNI152_1mm_nlinSym` naming
- Changed atlas reference to `mni_icbm152_t1_tal_nlin_sym_09a_mask.nii.gz`
- Updated description text to "MNI152 1mm NLIN SYM 09a"

### Naming Convention
All instances of `MNI152_0.8mm` and `MNI152_0p8mm` have been replaced with `MNI152_1mm_nlinSym` throughout the codebase, ensuring consistent naming for:
- Transformation file names: `*_to-MNI152_1mm_nlinSym_*`
- Variable names in shell scripts
- JSON keys in transformation metadata
- QC output file names

### Backward Compatibility
- Legacy 2mm MNI152 registration is maintained for backward compatibility
- Existing workflow structure preserved
- Transformation file structure unchanged

### Exception
The cerebellar atlas intentionally remains at 0.8mm (line 286 in `01_proc-structural.sh`) until a cerebellar atlas becomes available for MNI NLIN SYM 09a. This is clearly documented in the code.

## Validation
- ✅ All bash scripts pass syntax validation
- ✅ Python QC.py passes syntax validation
- ✅ No orphaned references to old naming conventions
- ✅ All transformation paths are consistent
- ✅ Ready for pipeline integration testing

## Reference
Fonov, V., Evans, A. C., Botteron, K., Almli, C. R., McKinstry, R. C., Collins, D. L., & Brain Development Cooperative Group. (2011). Unbiased average age-appropriate atlases for pediatric studies. *Neuroimage*, 54(1), 313-327.

<!-- START COPILOT CODING AGENT SUFFIX -->

<details>

<summary>Original prompt</summary>

>
> ----
>
> *This section details on the original issue you should resolve*
>
> <issue_title>MNI atlas update</issue_title>
> <issue_description>## Description
> The current MNI152 atlas (linear asymmetric 0.8x0.8x0.8mm and 2x2x2mm) used in `01_proc_structural.sh` needs to be replaced with the MNI NLIN SYM 09a atlas (non-linear symmetric 1x1x1). This update will improve the accuracy of transformations and alignments in the pipeline (LAMAReg).
>
> > Fonov, V., Evans, A. C., Botteron, K., Almli, C. R., McKinstry, R. C., Collins, D. L., & Brain Development Cooperative Group. (2011). Unbiased average age-appropriate atlases for pediatric studies. Neuroimage, 54(1), 313-327.
>
> ## Tasks
> - [ ] Replace Atlas:
>   - 01_proc_structural.sh (lines 182-200) to register the T1native pro to the mni_icbm152_t1_tal_nlin_sym_09a_synthseg
>   - Update Transformation Files:
>
> - [ ] Replace the string MNI152_0.8mm with MNI152_1mm_nlinSym in all transformation files.
>   - Ensure the updated files are saved under the xfm directory.
>   - Update Inputs and Outputs:
>
> - [ ] Adjust input and output paths to reflect the new atlas.
>   - Update intermediate files to ensure compatibility with the new atlas.
>   - Update Transformation JSON:
>
> - [ ] Modify the transformation JSON file to include the appropriate names for the new atlas.
>
> - [ ] Test the updated pipeline thoroughly to confirm the changes are applied correctly.
>
> ## Acceptance Criteria
>
> - The MNI NLIN SYM 09a atlas is correctly integrated into the pipeline.
> - All transformation files and paths are updated to reflect the new atlas.
> - The transformation JSON file is updated with accurate names.
> - The pipeline runs successfully with the new atlas without errors.
>
> ## References
>
> - File path for the new atlas: `micapipe/MNI152Volumes/mni_icbm152_t1_tal_nlin_sym_09a.nii.gz`
> - Current script: `01_proc_structural.sh` (lines 182-200)
>
>
> </issue_description>
>
> <agent_instructions>check if the newly changes meets the issue requirements</agent_instructions>
>
> ## Comments on the Issue (you are @copilot in this section)
>
> <comments>
> </comments>
>

</details>
Fixes MICA-MNI/micapipe#153

<!-- START COPILOT CODING AGENT TIPS -->
---

✨ Let Copilot coding agent  — coding agent works faster and does higher quality work when set up for your repo.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4bd0e10d32cd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.