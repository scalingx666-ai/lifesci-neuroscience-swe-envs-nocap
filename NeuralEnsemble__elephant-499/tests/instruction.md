# Issue

**Title:** Fix/onedimensional sigma

## Description

This PR addresses Issue #455 .

### Changes
- check dimensions of sigma, if dimension > 0 , raise `typeError`
- handle unambiguous case `ndim=1` , `size = 1` with `sigma = sigma[0]`
- added tests for both above cases

### Test
The following code snippet should no longer throw an error

```python
import neo
import elephant
import quantities as pq

st = neo.SpikeTrain([1]*pq.s, t_stop=2*pq.s)
kernel = elephant.kernels.GaussianKernel(sigma=[20]*pq.ms)

rate = elephant.statistics.instantaneous_rate(st,
                                              sampling_period=1*pq.ms,
                                              kernel=kernel)
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0df45812b932`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.