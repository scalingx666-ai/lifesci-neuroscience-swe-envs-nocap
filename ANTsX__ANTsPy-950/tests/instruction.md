# Issue

**Title:** BUG: resample_image_to_target output image must be float

## Description

`resample_image_to_target` returns wrong values when the moving image is not `float`. A mask made with a comparison is enough:

```python
import ants
import numpy as np

fi = ants.image_read(ants.get_ants_data("r16"))
fi2mm = ants.resample_image(fi, (2, 2), use_voxels=0, interp_type=1)
mask = fi > fi.mean()  # unsigned char
out = ants.resample_image_to_target(mask, fi2mm, interp_type="nearestNeighbor")
print(np.unique(out.numpy()))  # [  0.  63. 128.], expected [0. 1.]
```

`antsApplyTransforms` runs with `--float 1`, so it creates a float image and assigns it to the `-o` pointer. That pointer comes from `moving.clone()`, so the result is read back with the moving pixel type:
- `unsigned char`: each output voxel is one byte of the float result. 0, 128 and 63 are the bytes of 1.0f.
- `unsigned int`: the float bits read as integers, e.g. 1.0 becomes 1065353216.
- `double`: the read goes past the end of the float buffer, which segfaults on large images. For example, resampling a 320³ image to 160³ crashes.

#647 (from #641) changed `f` and `m` to `.clone('float')` but left the output image. `apply_transforms` and `resample_image` already use a float output. This changes `warpedmovout` to `moving.clone('float')`.
- The returned image still has the target's pixel type.
- For float moving images the output is bit-identical to before. I checked 2D, 3D and 4D, `imagetype` 0-3, and all interpolators.

The same thing happens wherever an integer image reaches this function, e.g. the overlay in `ants.plot` when the overlay is in a different space, and segmentations in `randomly_transform_image_data`.

Tests:
- `test_resample_image_to_target` in `test_ants_pointers.py`, using the pointer checks from #925.
- `test_resample_image_to_target_pixeltypes` in `test_registration.py`. It clones an `unsigned char` mask to each pixel type and resamples it to 2 mm with `nearestNeighbor` and `genericLabel`. The 2 mm voxel centres land on every second 1 mm voxel, so the expected result is `mask.numpy()[::2, ::2]`.

Both fail on `main` and pass here.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1fb9b8585f69`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.