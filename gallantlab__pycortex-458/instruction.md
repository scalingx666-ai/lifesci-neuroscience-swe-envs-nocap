# Issue

**Title:** FIX Correctly handle NaNs in `VertexRGB` and `VolumeRGB`

## Description

When creating a new `VertexRGB` object with vertices containing NaNs, the values of those vertices would be cast to uint8 and transformed to 0. However, the alpha value would be set to 1, causing the Nan vertices to appear black. This PR fixes this issue by automatically setting a correct alpha of 0 for NaN values. It partially addresses #455.

Minimal example:
```python
import cortex
import numpy as np
import matplotlib.pyplot as plt

# get an roi to mask out
roi = cortex.get_roi_verts("fsaverage", roi="IPS0")["IPS0"]

# Make a VertexRGB object
c = np.linspace(0, 1, 327684)
rgb = np.array([c, np.zeros_like(c), np.zeros_like(c)])
rgb[:, roi] = np.nan
vtx = cortex.VertexRGB(*rgb, "fsaverage")

cortex.webgl.show(vtx)
cortex.quickshow(vtx, with_colorbar=False, with_curvature=True);plt.show()
```

Before:
![image](https://user-images.githubusercontent.com/6150554/178616975-171a6903-3c23-4a55-a02f-5602e94d9e79.png)
![image](https://user-images.githubusercontent.com/6150554/178616990-004c096d-09a9-4f56-abc7-d6c7357ff8e5.png)


After:
![image](https://user-images.githubusercontent.com/6150554/178616768-f30da715-225a-45fb-b44f-f3b5a87c0641.png)
![image](https://user-images.githubusercontent.com/6150554/178616724-c98d0610-f185-4163-971e-5c12664e2684.png)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cd45d2e1086d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.