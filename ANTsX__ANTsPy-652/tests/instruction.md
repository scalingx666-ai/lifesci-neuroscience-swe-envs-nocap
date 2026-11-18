# Issue

**Title:** FIX: compose multi type transforms

## Description

This PR lets you compose transforms of multiple types. There are really only two types of transforms wrapped by antspy though: itk::Transform and itk::DisplacementFieldTransform.

This example should work:

```python
import ants
import numpy as np
image = ants.image_read(ants.get_ants_data("r16"))

linear_transform = ants.create_ants_transform(transform_type="AffineTransform", precision='float', 
        dimension=image.dimension)

translation = (30,30)
translation_matrix = np.array([[1, 0, translation[0]], [0, 1, translation[1]]])
linear_transform.set_parameters(translation_matrix)

displacement_field = ants.simulate_displacement_field(image, field_type="bspline", 
        number_of_random_points=10000, sd_noise=20.0, enforce_stationary_boundary=True, 
        number_of_fitting_levels=4, mesh_size=2, sd_smoothing=4.0)

displacement_field_xfrm = ants.transform_from_displacement_field(displacement_field)

xfrm = ants.compose_ants_transforms([linear_transform, displacement_field_xfrm])
image2 = xfrm.apply_to_image(image)

image2.plot() # should see translation and deformation
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `34536fcbccda`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.