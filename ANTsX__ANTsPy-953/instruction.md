# Issue

**Title:** BUG: fit_bspline_displacement_field ignored displacement_weights

## Description

`fit_bspline_displacement_field` ignores `displacement_weights`. When the weights have the right length, the `else` branch of the length check replaces them with ones:

```python
if displacement_weights is not None and (len(displacement_weights) != displacement_origins.shape[0]):
    raise ValueError("Length of displacement weights must match the number of displacement points.")
else:
    displacement_weights = np.ones(displacement_origins.shape[0])
```

Two points 4 voxels apart with opposite displacements show it. Swapping the weights should flip the field between them, but on main it does not:

```python
import ants
import numpy as np

origins = np.array([[30.0, 32.0], [34.0, 32.0]])
deltas = np.array([[6.0, 0.0], [-6.0, 0.0]])
for weights in ([1.0, 1e-3], [1e-3, 1.0]):
    field = ants.fit_bspline_displacement_field(
        displacement_origins=origins, displacements=deltas, displacement_weights=np.array(weights),
        origin=[0.0, 0.0], spacing=[1.0, 1.0], size=[64, 64], direction=np.eye(2),
        number_of_fitting_levels=3, mesh_size=1, enforce_stationary_boundary=False)
    print(weights, field.numpy()[32, 32, 0])
# main:      0.027482228 for both
# this PR:   5.9780083 and -5.9758
```

The values from this PR are the ones `fitBsplineDisplacementFieldToScatteredDataD2` gives when called directly with the same weights. The same happens when the points are combined with a dense `displacement_field`.

`fit_transform_to_paired_points` (bspline, diffeo, syn and tv) and `fit_time_varying_transform_to_point_sets` pass `displacement_weights` through, so they ignored the weights as well.

This removes the `else`. The existing default further down already fills in ones when no weights are given, so calls without weights give the same result as before. `test_bspline_field_displacement_weights` checks the example above, and that `None` gives the same field as equal weights. It fails on main and passes here.

Some side notes:
- **ANTsR:** `fitBsplineDisplacementField` has the same `else`.
- **A weight of exactly 0 with `rasterize_points=True`:** this case could not be reached before, and it gives a wrong field. The rasterization in `fitBsplineDisplacementFieldToScatteredData.cxx` divides by the summed weight, which is then 0. I can send a separate fix for that.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `99e85bdf7b6e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.