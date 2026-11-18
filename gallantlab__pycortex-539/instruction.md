# Issue

**Title:** NF Add functions to project volume data to surface while dealing with NaNs.

## Description

These new functions can be used to project data from the volume to any arbitrary surface via a combination of pycortex mappers and `mri_surf2surf`. The projection deals with nans similar to quickshow and `nanproject=True`.

Example code:
```python
import cortex
from cortex.mapper import vol2surf
import numpy as np

subject = ...  # anonymized
xfm = ...  # anonymized

vol = cortex.Volume.random(subject, xfm, mask="thick")
mask = cortex.db.get_mask(subject, xfm)
data = vol.data[mask]
data[np.random.randn(*data.shape) > 0] = np.nan

new_volume = cortex.Volume(data, subject, xfm, mask="thick")
surface = cortex.Vertex(vol2surf(data, subject, xfm), subject)
fsaverage = cortex.Vertex(vol2surf(data, subject, xfm, target_surface="fsaverage"), "fsaverage")

fig = cortex.quickshow(new_volume, with_colorbar=False, with_curvature=True, with_rois=False, with_labels=False, nanmean=False,)
fig.suptitle("volume, nanmean=False", fontsize=24)
fig = cortex.quickshow(new_volume, with_colorbar=False, with_curvature=True, with_rois=False, with_labels=False, nanmean=True,)
fig.suptitle("volume, nanmean=True", fontsize=24)
fig = cortex.quickshow(surface, with_colorbar=False, with_curvature=True, with_rois=False, with_labels=False,)
fig.suptitle("vol2surf", fontsize=24)
fig = cortex.quickshow(fsaverage, with_colorbar=False, with_curvature=True, with_rois=False, with_labels=False,)
fig.suptitle("fsaverage", fontsize=24)
```

Outputs:
<img width="600" alt="image" src="https://github.com/gallantlab/pycortex/assets/6150554/0724b55e-06bd-490d-b5ab-f322c6945ab5">
<img width="600" alt="image" src="https://github.com/gallantlab/pycortex/assets/6150554/4673a736-6b5b-4245-b1c1-0655e56e2910">
<img width="600" alt="image" src="https://github.com/gallantlab/pycortex/assets/6150554/5613a367-b860-43f3-ae72-5646cd878249">
<img width="600" alt="image" src="https://github.com/gallantlab/pycortex/assets/6150554/c47ad559-6c0c-4fb3-9ad5-af2f1607c642">

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a5368352b30d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.