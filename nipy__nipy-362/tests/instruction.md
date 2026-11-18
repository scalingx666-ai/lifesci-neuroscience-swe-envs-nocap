# Issue

**Title:** MRG: hack to work round np.intp bug in ndimage

## Description

Scipy ndimage, at least for scipy 0.9.0, fails when trying to interpolate data
of type np.intp, on a 32-bit system we are testing on:

http://nipy.bic.berkeley.edu/builders/nipy-py2.6-32/builds/291/steps/shell_6/logs/stdio

The interpolation failure gives an error like this:

```
File "/usr/lib/python2.7/dist-packages/scipy/ndimage/interpolation.py", line 392, in affine_transform
    output, order, mode, cval, None, None)
    RuntimeError: data type not supported
```

In fact, the numpy types np.int32 and np.intp (on 32-bits) are the same 32-bit
signed integer types, so we can just view the data as np.int32 (on 32 bits)
before running the ndimage routines.

Write wrappers around `affine_transform` and `map_coordinates` to do this
conversion, and extend tests.

The tests raise some errors on very old scipy, so update scipy dependency to
0.9.0.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5ddd0ecc5b1b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.