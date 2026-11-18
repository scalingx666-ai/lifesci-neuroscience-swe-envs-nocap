# Issue

**Title:** BF: Apply scaling intercept to both complex components

## Description

Loading a complex NIfTI voxel `1+2j` with `scl_slope=2` and `scl_inter=3` gives `5+4j`. The [NIfTI specification](https://github.com/nipy/nibabel/blob/2f7c14298ab8f5cea66d0f2f89cd38eff6b3438c/doc/source/external/nifti1.h#L435-L446) requires applying `slope*x+intercept` to each component, giving `5+7j`.

```python
import numpy as np
from nibabel.volumeutils import apply_read_scaling

assert apply_read_scaling(np.array([1 + 2j]), 2, 3)[0] == 5 + 7j
```

We apply the intercept to the imaginary component and align the existing complex image test expectation with this rule. We've added a regression for complex types and both byte orders, and the relevant scaling and NIfTI tests pass.

— [ChipLab](https://chiplab.donmakino.com/findings#clab-2026-1195)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5ac55aacc9cd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.