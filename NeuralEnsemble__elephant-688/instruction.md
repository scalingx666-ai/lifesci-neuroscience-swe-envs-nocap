# Issue

**Title:** Add runtime kernel length check in `trim=True` instantaneous_rate

## Description

## Issue
When kernel length is larger than binned spiketrain length in `trim=True` case, it leads to ambiguous and incorrect offset in rate values, the following minimal code can trigger this case:
```
from elephant import statistics
from quantities import ms, s, Hz
from elephant.spike_train_generation import homogeneous_poisson_process
import numpy as np

np.random.seed(22)
sts = homogeneous_poisson_process(rate=10*Hz, t_start=0.*ms, t_stop=10000.*ms)
rate_estimate = statistics.instantaneous_rate( sts, sampling_period=50*ms, kernel="auto",
    t_start=sts.t_start, t_stop=sts.t_stop, trim=True,
)
``` 
## Fix
Enforces a kernel length check for `trim=True` case when computing instantaneous rates from binned spiketrains. Raises a Value error if the kernel is longer than the binned spiketrain.

## Cleanup
Removed  `t_stop` parameter passed to the ` neo.AnalogSignal ` constructor since it is not part of the initialization API and was being used as just an annotation.

## Tests
- Added decorator to skip `test_instantaneous_rate_spikes_on_edges` test, which incorrectly assumed rate magnitude is zero for all cases with edge spikes
- Added new tests:
1. `test_instantaneous_rate_trim_output_length`: checks that valid convolution produces the expected output length.
2. `test_instantaneous_rate_trim_rate_estimation`: checks that area under the curve for `trim=True` (valid convolution) is less than or equal to `trim=False` (same convolution) in order to verify edge trimming behavior.
3. `test_instantaneous_rate_trim_edges`: checks if t_stop for rate is calculated correctly with `trim=True`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `976e5fd768ef`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.