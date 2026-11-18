# Issue

**Title:** Use `nilearn.resample_to_img` for merging fragments

## Description

Based on the  at #561 
Code to test:
```python
import siibra
from nilearn import plotting
res = 0.68
fmt = 'neuroglancer/precomputed'
bg_img = siibra.get_template('mni152').fetch(format=fmt, resolution_mm=res)
mp = siibra.get_map('2.9', 'mni152')
cmap = mp.get_colormap()
img = mp.fetch(format=fmt, resolution_mm=res)
plotting.view_img(img, bg_img=bg_img, symmetric_cmap=False, cmap=cmap).open_in_browser()
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4db78e41ffd2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.