# Issue

**Title:** DOC: Include template metadata information when resampling BOLD to surface

## Description

Follow up on #3461 to include template information

<details>
<summary>Sampler boilerplate text</summary>

The BOLD time-series were resampled onto the left/right-symmetric template “fsLR” using the Connectome Workbench (Glasser et al. 2013). The BOLD time-series were resampled onto the native surface of the subject using the “ribbon-constrained” method and then dilated by 10 mm.Grayordinates files (Glasser et al. 2013) containing 91k samples were also generated with surface data transformed directly to fsLR space and subcortical data transformed to 2 mm resolution MNI152NLin6Asym space. The BOLD series was resampled to OpenNeuro Average (onavg) surface template [Feilong et al. (2024); TemplateFlow ID: onavg] using the Connectome Workbench. All resamplings can be performed with a single interpolation step by composing all the pertinent transformations (i.e. head-motion transform matrices, susceptibility distortion correction when available, and co-registrations to anatomical and output spaces). Gridded (volumetric) resamplings were performed using nitransforms, configured with cubic B-spline interpolation. Non-gridded (surface) resamplings were performed using the Connectome Workbench.Grayordinate “dscalar” files containing 91k samples were resampled onto fsLR using the Connectome Workbench (Glasser et al. 2013).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d28596f2c2ce`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.