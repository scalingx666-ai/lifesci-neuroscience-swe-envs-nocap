# Issue

**Title:** Fix/instantaneous rate

## Description

This PR addresses #374 .

Reproduce with:
```python
import matplotlib.pyplot as plt
import numpy as np
import quantities as pq

from elephant import statistics, kernels
from elephant.spike_train_generation import homogeneous_poisson_process

np.random.seed(0)
spiketrain = homogeneous_poisson_process(rate=10 * pq.Hz,
                                         t_stop=10 * pq.s)
kernel = kernels.GaussianKernel(sigma=300 * pq.ms)
sampling_period = 445 * pq.ms
rate = statistics.instantaneous_rate(
    spiketrain,
    sampling_period=sampling_period,
    kernel=kernel, center_kernel=True, trim=False)

plt.plot(rate.times.simplified.magnitude, rate.magnitude, color='orange',
         label='instantaneous rate')
plt.eventplot(
    [spiketrain.simplified.magnitude, rate.times.simplified.magnitude],
    colors=['black', 'green'], lineoffsets=2, linelengths=1)
plt.legend()
plt.title(f"{kernel.__class__.__name__}: sigma={int(kernel.sigma.item())} ms, "
          f"sampling_period={int(sampling_period.item())} ms")
fig=plt.gcf()
fig.set_size_inches (18.5, 10.5)
plt.show()
```
![original_374](https://user-images.githubusercontent.com/92092328/156189849-1480a2e1-156d-4359-ace0-27bf15eb05cb.png)

The green bars in the above figure represent the `rate.times`. In Issue #374 it is suspected that one rate time is missing.
Inspecting the rate.times with:
```python
# print the timepoints for the estimated rates
print (rate.times)
```
yields:
```
[0.    0.445 0.89  1.335 1.78  2.225 2.67  3.115 3.56  4.005 4.45  4.895 5.34  
5.785 6.23  6.675 7.12  7.565 8.01  8.455 8.9   9.345] s
```
This output of the calculated instantaneous rate seems to be expected. 
Explanation: The rate estimation is working on an interval e.g. the first interval here is [0, 0.445), the corresponding rate estimate has a `rate.times` value of `0` (see figure above, orange line at time 0s). The rate estimate for interval [9.345, 9.790) is given at 9.345 (orange line).
The last interval [9.790, 10.235), which would be drawn at 9.790s, is excluded since it is not a full interval for the given spiketrain with `t_stop =10 s ` and `sampling_period=0.445`. The rate estimate is hence considered to be "not valid" and is not returned by `statistics.instantaneous_rate`. (this is expected)

---
Unreported Bug: calculation of range for `np.histogram` in https://github.com/NeuralEnsemble/elephant/blob/b263ffe80e5ab759288ad25331cde4f6a359f3ec/elephant/statistics.py#L827

To reproduce: (note that the chosen `spike_times` are just multiples of the sampling period shifted by 0.01s, compare to `rate.times` values from previous example)
```python
import matplotlib.pyplot as plt
import numpy as np
import quantities as pq
import neo

from elephant import statistics, kernels

spike_times = np.array([4.45, 4.895, 5.34, 5.785, 6.23, 6.675, 7.12]) *pq.s
# add 0.01 s
spike_times+=.01 *pq.s

spiketrain = neo.SpikeTrain(spike_times,
                                    t_start=0,
                                    t_stop=10)
kernel = kernels.GaussianKernel(sigma=500 * pq.ms)
sampling_period = 445 * pq.ms
rate = statistics.instantaneous_rate(
    spiketrain,
    sampling_period=sampling_period,
    kernel=kernel, center_kernel=True, trim=False)

plt.plot(rate.times.simplified.magnitude, rate.magnitude, color='orange',
         label='instantaneous rate')
plt.eventplot(
    [spiketrain.simplified.magnitude, rate.times.simplified.magnitude],
    colors=['black', 'green'], lineoffsets=2, linelengths=1)
plt.legend()
plt.title(f"{kernel.__class__.__name__}: sigma={int(kernel.sigma.item())} ms, "
          f"sampling_period={int(sampling_period.item())} ms")
fig=plt.gcf()
fig.set_size_inches (18.5, 10.5)
plt.show()

```
![timeshift of two sampling rate](https://user-images.githubusercontent.com/92092328/156201670-3f1cfafb-09ed-4bf4-853b-3619ed11a3df.png)

The rate estimation (orange line) in comparison to the spikes (black bars) appears to be shifted by one `sampling_period` (green bars). Note that the `spike_times` were deliberately chosen so that there should be no sampling bias here. This bug is somewhat concealed since the `rate_times` are generated with: 

https://github.com/NeuralEnsemble/elephant/blob/b263ffe80e5ab759288ad25331cde4f6a359f3ec/elephant/statistics.py#L896-L899

In other words, the green bars do not represent the intervals used for the calculation of the rate estimation (implemented with `np.histogram`).

This PR fixes the calculation of the range for `np.histogram`. Using the code example from above now yields:

![timeshift of two sampling rate fixed](https://user-images.githubusercontent.com/92092328/156205046-f564c656-ca76-4cd3-8fe9-315f4541d006.png)
---
Additionally this fixes lines 874 - 890, which are no longer needed, if the following behavior is expected.

to reproduce:
```python
import matplotlib.pyplot as plt
import numpy as np
import quantities as pq
import neo

from elephant import statistics, kernels

spike_times = np.array([9.65, 9.7, 9.75]) *pq.s

spiketrain = neo.SpikeTrain(spike_times,
                                    t_start=0,
                                    t_stop=9.8)
kernel = kernels.GaussianKernel(sigma=250 * pq.ms)
sampling_period = 1000 * pq.ms
rate = statistics.instantaneous_rate(
    spiketrain,
    sampling_period=sampling_period,
    kernel=kernel, center_kernel=False, trim=False, cutoff=1)

plt.plot(rate.times.simplified.magnitude, rate.magnitude, color='orange',
         label='instantaneous rate')
plt.eventplot(
    [spiketrain.simplified.magnitude, rate.times.simplified.magnitude],
    colors=['black', 'green'], lineoffsets=2, linelengths=1)
plt.legend(loc=2)
plt.title(f"{kernel.__class__.__name__}: sigma={int(kernel.sigma.item())} ms, "
          f"sampling_period={int(sampling_period.item())} ms")
plt.xticks(np.arange(0, 11, step=1))
fig=plt.gcf()
fig.set_size_inches (18.5, 10.5)
plt.show()
```
In current implementation the last interval [9.0, 9.8) (`t_start=0, t_stop=9.8, sampling_period=1s`) is used to estimate the rate in other intervals, see output: 
![include last interval in estimation old](https://user-images.githubusercontent.com/92092328/156214283-912c657e-a257-43b5-a5a2-41aa89f9e7f7.png)

with this PR, the last "not valid" interval [9.0, 9.8) is no longer considered:

![include last interval in estimation new](https://user-images.githubusercontent.com/92092328/156214539-09e3b2de-a8e3-4dc2-8983-5249ab36871c.png)




- [ ] merge after reconciling with PR #414 
- [ ] add regression tests

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7a6d3f257593`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.