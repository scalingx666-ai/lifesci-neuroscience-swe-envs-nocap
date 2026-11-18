# Issue

**Title:** NF new params for a multipanel figure with all views

## Description

Example output:
![example-new-view](https://user-images.githubusercontent.com/6150554/169116958-ea8a9e11-5309-485c-8119-550e5218a073.png)

Code to generate example:

```python
import cortex
import numpy as np
from cortex.export.panels import params_flatmap_inflated_lateral_medial_ventral as params

subject = 'S1'
shape = cortex.db.get_xfm(subject, 'identity').shape
data = np.arange(np.product(shape)).reshape(shape)
volume = cortex.Volume(data, subject=subject, xfmname='identity')

cortex.export.plot_panels(volume, **params, save_name="example-new-view.png")
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7ba544978c35`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.