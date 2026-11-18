# Issue

**Title:** BF: Fix radRamp pattern being uniformly -1

## Description

`createLumPattern('radRamp', res)` clips the corners with `numpy.where(rad < -1, intensity, -1)`. `rad` is a distance from the centre and is never negative, so the condition is always false and every texel is set to -1. As a result a `GratingStim` with `mask='radRamp'` draws nothing.

```python
from psychopy.tools.arraytools import createLumPattern
print(createLumPattern('radRamp', 4))
```

On `release` (2026.2.4):

```
[[-1. -1. -1. -1.]
 [-1. -1. -1. -1.]
 [-1. -1. -1. -1.]
 [-1. -1. -1. -1.]]
```

With this change:

```
[[-1.         -1.         -1.         -1.        ]
 [-1.         -0.41421356  0.         -0.41421356]
 [-1.          0.          1.          0.        ]
 [-1.         -0.41421356  0.         -0.41421356]]
```

The fix compares against 1 instead, which is what this pattern did before 2db9cf033 (2008). That commit merged the mask code, which used a 0..255 range, into the -1..1 texture code and replaced `numpy.where(rad<1, intensity, 0)` with `numpy.where(rad<-1, intensity, -1)`; the line was later moved into `arraytools` in ba9318b7a. `raisedCos` in the same function also uses `rad < 1`. With this change a `mask='radRamp'` stimulus draws the radial ramp again instead of nothing.

I also drew a `GratingStim(win, tex=None, mask='radRamp', size=64, color=1)` in a 64x64 pix window with `color=-1` under Xvfb and read the back buffer: the highest pixel value was 0 before the change and 249 after, while `mask='circle'` gives 255 in the same setup.

Added `test_createLumPattern_radRamp` to `psychopy/tests/test_tools/test_arraytools.py`. It fails on `release` and passes with the fix. `pytest psychopy/tests/test_tools` goes from 71 passed to 72 passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5ee7b7f8b8a4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.