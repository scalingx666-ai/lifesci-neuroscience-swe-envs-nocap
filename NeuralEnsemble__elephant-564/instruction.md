# Issue

**Title:** [Fix] spike time tiling coefficient for unsorted spiketrains, added validation test

## Description

This is related to Issue #563 .

The example from the Issue now returns:

- STTC for E7 and E3: 1.0  (Spiketrains identical)
- STTC for E8 and B3: -0.02 (Spiketrains different)

Previously, this function encountered a bug when using unsorted spiketrains as input, leading to the generation of values exceeding the desired range of -1 to 1.

This fix involves several improvements: 
- the spiketrains used as input are now sorted 
- additional input checks were added 
- added a regression test, verifying that the sttc function returns values within the desired range of -1 to 1, with the example given in the Issue

Example Code:
```python
import neo

import quantities as pq

from elephant.spike_train_correlation import spike_time_tiling_coefficient

spiketrain_E7 = neo.SpikeTrain([ 1678. , 23786.3, 34641.8, 71520.7, 73606.9, 78383.3,
97387.9, 144313.4, 4607.6, 19275.1, 152894.2, 44240.1], units='ms', t_stop=160000*pq.ms)

spiketrain_E3 = neo.SpikeTrain([ 1678. , 23786.3, 34641.8, 71520.7, 73606.9, 78383.3,
97387.9, 144313.4, 4607.6, 19275.1, 152894.2, 44240.1], units='ms', t_stop=160000*pq.ms)

print(spike_time_tiling_coefficient(spiketrain_E7, spiketrain_E3, dt=0.10 * pq.s))

spiketrain_E8 = neo.SpikeTrain([ 20646.8, 25875.1, 26154.4, 35121. , 55909.7, 79164.8,
110849.8, 117484.1, 3731.5, 4213.9, 119995.1, 123748.1,
171016.8, 172989. , 185145.2, 12043.5, 185995.9, 186740.1,
12629.8, 23394.3, 34993.2], units='ms', t_stop=210000*pq.ms)

spiketrain_B3 = neo.SpikeTrain([ 10600.7, 19699.6, 22803. , 40769.3, 121385.7, 127402.9,
130829.2, 134363.8, 1193.5, 8012.7, 142037.3, 146628.2,
165925.3, 168489.3, 175194.3, 10339.8, 178676.4, 180807.2,
201431.3, 22231.1, 38113.4], units='ms', t_stop=210000*pq.ms)

print(spike_time_tiling_coefficient(spiketrain_E8, spiketrain_B3, dt=0.10 * pq.s))
```

## todo:
- [x] added validation tests against c-implementation from https://github.com/CCutts/Detecting_pairwise_correlations_in_spike_trains/blob/master/spike_time_tiling_coefficient.c
- [x] merge elephant-data PR: https://gin.g-node.org/NeuralEnsemble/elephant-data/pulls/4


A description of the sttc algorithm can be found here: https://doi.org/10.1523/jneurosci.2767-14.2014 .

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `913a99826077`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.