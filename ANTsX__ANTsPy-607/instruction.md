# Issue

**Title:** ENH:  Add masked/bspline fitting variant of Nyul histogram matching.

## Description

Example.  Be sure to compare the actual source and transformed source images.


```python
import ants
from matplotlib import pyplot

source_image = ants.image_read(ants.get_ants_data("r16"))
source_mask = ants.get_mask(source_image)

reference_image = ants.image_read(ants.get_ants_data("r64"))
reference_mask = ants.get_mask(reference_image)

tx_source_image = ants.histogram_match_image2(source_image, reference_image, 
                                              source_mask, reference_mask,
                                              match_points=64,
                                              transform_domain_size=255)

# ants.image_write(tx_source_image, "tx_r16.nii.gz")

x = source_image[source_mask != 0].flatten()
y = reference_image[reference_mask != 0].flatten()
tx = tx_source_image[source_mask != 0].flatten()

pyplot.hist([x, y, tx], 64, alpha=0.5, label=["Source", "Ref", "Tx"])
pyplot.legend(loc="upper right")
pyplot.show()
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f79e9f3ac9cf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.