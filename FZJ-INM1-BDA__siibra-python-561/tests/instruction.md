# Issue

**Title:** Introduce merging Neuroglancer fragments

## Description

When a map with fragmented Neuroglancer volumes is requested without specifying a fragment, the fetch fails as merging of fragments for Neuroglancer volumes was not implemented (#551). Test with:

```python
from nilearn import plotting
import siibra
mp = siibra.get_map('cortical layers', space='bigbrain')
res = 0.64
img = mp.fetch(resolution_mm=res)
bigbrain = siibra.get_template('bigbrain').fetch(resolution_mm=res)
plotting.view_img(img, bg_img=bigbrain, cmap=mp.get_colormap(), symmetric_cmap=False)
```

Also, fixes voxel dimension calculation during mergin fragments of nifti volumes. (This was not a problem most of the time since the voxel size of most fragmented nifti is 1 mm)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `da6e33cbdb9b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.