# Issue

**Title:** FIX: cast unsupported numpy dtypes in ants.from_numpy()

## Description

If you try to create an ants image from an array with an unsupported numpy dtype, it just fails. Since we only support 4 dtypes, we really should support automatically casting unsupported dtypes to supported ones. This PR does that.

The one question I have is whether it is good to warn the user that their data is being casted or to just do it silently. Having a bunch of warnings is annoying and pollutes the console, but I can see some people being confused that their data is in a different dtype otherwise.

Below is an example that fails.  The `int16` type is quite common for segmentation arrays which is how I discovered the error:

```python
import numpy as np
import ants

arr = np.random.randn(100,100).astype('int16')
img = ants.from_numpy(arr)
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e667c280e34b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.