# Issue

**Title:** Option to remove subcortical voxels when plotting power maps.

## Description

Closes 

Changes:
- Added a new argument `remove_subcortical_voxels` that can be used to remove subcortical voxels (set voxel values to nan) when plotting plot maps.

Note: we hard code the voxel indices for subcortical regions. **They are only valid for 8x8x8 mm grids** (in MNI space).

Example use:
```
import numpy as np
from osl_dynamics.analysis import power
from matplotlib.colors import LinearSegmentedColormap

colors = [(1, 0, 0, 1), (.5, .5, .5, .5)]
cmap_pval = LinearSegmentedColormap.from_list("cmap", colors, N=256)

pvals = np.ones(52)
power.save(
    pvals,
    mask_file="MNI152_T1_8mm_brain.nii.gz",
    parcellation_file="Glasser52_binary_space-MNI152NLin6_res-8x8x8.nii.gz",
    plot_kwargs={
        "cmap": cmap_pval,
        "views": ["lateral", "medial"],
        "vmin": 0,
        "vmax": 0.05,
        "symmetric_cbar": False,
        "remove_subcortical_voxels": True,
    },
    filename="plot_.png",
)
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6fa9101af3c8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.