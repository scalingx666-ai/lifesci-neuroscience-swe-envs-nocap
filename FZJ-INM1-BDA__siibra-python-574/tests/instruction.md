# Issue

**Title:** Fix: fetch specific label from gii labels

## Description

Test snippet:
```python
import siibra
from nilearn import plotting
mp = siibra.get_map('julich 2.9', 'fsaverage')
mesh = mp.fetch('hoc1 left')
plotting.view_surf(
    surf_mesh=[mesh['verts'], mesh['faces']],
    surf_map=mesh['labels'],
    cmap=mp.get_colormap(),
    symmetric_cmap=False, colorbar=False
).open_in_browser()
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6001fad1f068`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.