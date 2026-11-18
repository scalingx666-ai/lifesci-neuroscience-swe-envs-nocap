# Issue

**Title:** Allow readonly arrays in numba jit signature

## Description

This PR is a continuation of the work contributed in PR #13 

Contributions of this PR:
- [x] allow readonly arrays in the numba jit signature
-> this was an issue for `sample_entropy` and `detrended_fluctuation`
- [x] minor refactoring of the tests - moving duplicate code to a `utils.py` file
- [x] adding 2 additional tests that test whether non-writable (i.e., readonly) arrays can be used as input for a range of datatypes

Other contribution:
- [x] set `nopython` to True for the `_higuchi_fd` function - this was the only `@jit` decorated function for which this flag was not set.

---

Illustration of the issue that this PR tackles:
```py
In [1]: import antropy as ant; import numpy as np

In [2]: ant.__version__
Out[2]: '0.1.5'

In [3]: x = np.random.randn(3_000).astype("float32")
   ...: x.flags.writeable = False
   ...: ant.detrended_fluctuation(x)
Out[3]: 0.5552594723035992

In [4]: x = np.random.randn(3_000).astype("float64")
   ...: x.flags.writeable = False
   ...: ant.detrended_fluctuation(x)
---------------------------------------------------------------------------
TypeError
    ...
TypeError: No matching definition for argument type(s) readonly array(float64, 1d, C)

In [5]: x = np.random.rand(3_000).astype("float32")
   ...: x.flags.writeable = False
   ...: ant.sample_entropy(x)
Out[5]: 2.17591547251706

In [6]: x = np.random.rand(3_000).astype("float64")
   ...: x.flags.writeable = False
   ...: ant.sample_entropy(x)
---------------------------------------------------------------------------
TypeError
    ...
TypeError: No matching definition for argument type(s) readonly array(float64, 1d, C), int64, float64

```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dc84ed1a03d6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.