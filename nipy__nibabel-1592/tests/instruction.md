# Issue

**Title:** BF: Return complex data from get_fdata() for complex images

## Description

`get_fdata()` defaults to float64, so a complex image (for example NIfTI-MRS data) comes back with the imaginary part dropped and only a NumPy `ComplexWarning` to show for it. Downstream readers work around this by passing `dtype=np.complex64` themselves.

Following the rule agreed in the issue, the default `dtype` is now `None`, which resolves to complex128 when the image data are complex and float64 otherwise. An explicit `dtype` is still respected, so `get_fdata(dtype=np.float64)` behaves as before. This is a behaviour change for complex images only: they now get complex128 by default where they used to get float64.

I added a test that round-trips complex64 and complex128 data through NIfTI-1/2 images (array and proxy), checks the cache, the explicit-dtype cases and that real images still default to float64. It fails on master and passes here; the full test suite passes locally.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ae9712686f87`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.