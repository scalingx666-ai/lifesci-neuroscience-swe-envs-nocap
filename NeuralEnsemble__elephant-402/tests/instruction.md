# Issue

**Title:** BinnedSpikeTrain optional CSC format

## Description

Could be useful in ASSET HEAT backend implementation.

Also, `BinnedSpikeTrain.binarize` is refactored: the copy parameter is back. If set to True, a **shallow** copy is returned.

------

Slicing a scipy CSC matrix does not internally convert it to a CSR matrix.

```python
import time
import tracemalloc

import numpy as np
import scipy.sparse

tracemalloc.start()
start = time.time()


def print_traced_mem(name=''):
    global start
    duration = time.time() - start
    curr, peak = tracemalloc.get_traced_memory()
    print(f">>> [{name}] curr={curr / 2 ** 20:.2f} Mb, peak={peak / 2 ** 20:.2f} Mb; duration={duration:.3f} sec")
    tracemalloc.reset_peak()
    start = time.time()


n = 5_000
a = np.arange(n * n, dtype=np.float32).reshape((n, n))
a_csc = scipy.sparse.csc_matrix(a)
print_traced_mem('begin')
a11 = a_csc[:n//2, :n//2]
print_traced_mem('a11')
a12 = a_csc[:n//2, n//2:]
print_traced_mem('a12')
```
```
>>> [begin] curr=286.14 Mb, peak=762.94 Mb; duration=0.793 sec
>>> [a11] curr=333.84 Mb, peak=333.84 Mb; duration=0.043 sec
>>> [a12] curr=381.53 Mb, peak=381.53 Mb; duration=0.042 sec
```
Same for a CSR matrix.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f56a62a68c16`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.