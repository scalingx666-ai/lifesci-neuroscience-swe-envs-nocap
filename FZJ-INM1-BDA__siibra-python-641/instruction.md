# Issue

**Title:** Allow random cmap creation for `map.get_color_map`

## Description

```python
import siibra
from nilearn import plotting
mp = siibra.get_map("deep bundles", "mni152")
cmap = mp.get_colormap(allow_random_colors=True)  # keyword has to be specified
plotting.view_img(mp.fetch(), cmap=cmap, symmetric_cmap=False).open_in_browser()
```

Uses the number of regions to determine the random seed for reproducibility.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `692599c8a248`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.