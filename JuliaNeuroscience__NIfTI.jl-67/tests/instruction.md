# Issue

**Title:** DATA SCALING should only be done when `slope!=0`.

## Description

As @kleinschmidt mentioned in #14, "slope/intercept should be used for nonzero slope", and only for nonzero.

A novice would 100% use ```nii_slice=niread(" my_niftifile.nii.gz ")[x,:,:]``` to read the "true" voxel value in a file.
In the [implementation](https://github.com/yeruoforever/NIfTI.jl/blob/3ca7b1732305d47aa18a7e917369ccc8ba8d1a2d/src/NIfTI.jl#L286), 
```julia
# Allow file to be indexed like an array, but with indices yielding scaled data
@inline getindex(f::NIVolume{T}, idx::Vararg{Int}) where {T} =
    getindex(f.raw, idx...,) * f.header.scl_slope + f.header.scl_inter
```
DATA SCALING is always done by default, which seems quite reasonable.

Let's consider the following:
* In some nii headers, `float scl_slope` will be set to `0` to indicate that "true" voxel is stored in the array value. This is in [NifTI1.h](https://nifti.nimh.nih.gov/pub/dist/src/niftilib/nifti1.h) defined.

 
At this point, all voxel values in the file are multiplied by slope and added to inter.
$$y = slope \times x + inter = 0 \times x + inter = inter$$

This means that the user is taking a matrix or tensor where all the elements have the same value.
The information in the image was erased without any awareness.

This can lead to a number of serious problems:
* All subsequent algorithms and functions use an erased image
* The code is executed without any warning! Everything seemed perfect.

Therefore, DATA SCALING should only be performed when slope!=0.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3ca7b1732305`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.