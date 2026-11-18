# Issue

**Title:** RF: Optimize ICC_rep_anova with a memoized helper function

## Description

@bbfrederick Post #3453, I got motivated to look at your PR again. I grokked the code a little better and realized we could do this more Pythonically.

WDYT? I set the `maxsize=1` to match your effective cache size. I don't really know how big these matrices can get, so I'm not sure whether that was a memory optimization or just an assumption that the number of switches back and forth between shapes is likely to be small.

@kristoferm94 Would be interested in your thoughts. This does break up the improved matrix ordering you provided, but I suspect the caching benefit is going to dominate here.

As some basic tests:

```Python
In [1]: import numpy as np

In [2]: rng = np.random.default_rng()

In [3]: from nipype.algorithms.icc import *

In [4]: %time ICC_rep_anova(rng.normal(size=(50, 10)))
CPU times: user 26.4 ms, sys: 67 ms, total: 93.4 ms
Wall time: 15.4 ms
Out[4]: 
(-0.0010955283641284907,
 -0.0012372157263673023,
 1.130569661036011,
 0.01640374953027528,
 9,
 441)

In [5]: ICC_projection_matrix.cache_clear()

In [6]: %time ICC_rep_anova(rng.normal(size=(50, 10)))
CPU times: user 431 µs, sys: 18.8 ms, total: 19.3 ms
Wall time: 3.14 ms
Out[6]: 
(0.052737606398966394,
 0.049204080066708754,
 0.8837938966422438,
 0.028379415383302194,
 9,
 441)

In [7]: %timeit ICC_rep_anova(rng.normal(size=(50, 10)))
160 µs ± 7.95 µs per loop (mean ± std. dev. of 7 runs, 10000 loops each)
```

Cells 4-6 is just to distinguish compilation effects. Cell 7 shows the effect of caching.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3dc858ea8055`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.