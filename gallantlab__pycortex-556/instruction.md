# Issue

**Title:** Clipping sliceplanes

## Description

This adds the option to clip the brain surface at sliceplanes. This enables simultaneous viewing of surface and deeper subcortical data. (Although to make this really useful we might need a way to have different datasets visible on the surface and sliceplanes, perhaps?)

It adds a new submenu, `clip`, under `sliceplanes`, with boolean toggles for `clip_{x,y,z}` and `flip_{x,y,z}`. The clip toggles hide the surface on one side of the sliceplane, and flip toggles switch which side that is. The sliceplanes can be moved and rotated as normal.

Here's a small script that you can run to test (it works better if you use a subject where the `brainmask.nii.gz` volume is available unlike the default subject S1; in that case replace `'raw'` with `'brainmask'`):
```python
import numpy as np
import cortex

subject = "S1"
anatdata = cortex.db.get_anat(subject, 'raw').get_fdata().T
anatdata[anatdata < 5] = np.nan
anatvol = cortex.Volume(anatdata, subject, 'identity')

cortex.webshow(anatvol)
```

I've also attached a screenshot of what it looks like with a subject where the masked brain is available.
<img width="1328" alt="Screen Shot 2024-10-17 at 15 01 44" src="https://github.com/user-attachments/assets/806db9f6-e6e3-4840-9654-fb9f95a641c2">

I haven't tested how this works with vertex data or RGB data or really anything but what you see. It's a start, anyway :)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e00e8798cf0a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.