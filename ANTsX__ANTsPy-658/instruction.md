# Issue

**Title:** ENH: support pickle and deepcopy for images

## Description

It was previously not possible to pickle ants images, so things like `deepcopy` failed. This PR adds basic pickle support via numpy. I had some random segfaults in some early versions of this PR but I believe the current version works well... something to keep an eye on anyways.

Example:

```python
import ants
import pickle
import numpy as np
from copy import deepcopy

img = ants.image_read( ants.get_ants_data("r16"))
img_pickled = pickle.dumps(img)
img2 = pickle.loads(img_pickled)
img3 = deepcopy(img)
img += 10
print(img.mean(), img2.mean())
print(img.mean(), img3.mean())
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6d99b60464e6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.