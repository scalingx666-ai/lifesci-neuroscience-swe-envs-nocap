# Issue

**Title:** Support SpikeTrainList object and deprecate RecordingChannel in Elephant

## Description

Since Neo 0.10.0, there is a new `SpikeTrainList` object. While this new construct behaves like a list, there are a couple of instances where Elephant directly tests if an input is explicitly a list of SpikeTrains. This PR adds support for allowing SpikeTrainList objects as well as lists of SpikeTrains in these circumstances. 

Fixes:
- `conversion.BinnedSpiketrain` (wtih regression test, where SpikeTrainLists would lead to incorrect binned matrices)
- `spike_train_synchrony.Synchrotool` class
- `spade` module
- `statistics` module, `instantaneous_rate()`

This PR .

Also, in Neo 0.10.0, `RecordingChannelGroup` objects are no longer supported. This affects the `current_source_density`, where electrode coordinates where optionally extracted form this object. This PR fixes CSD methods by taking electrode positions from an annotation of the signal. As in the previous version of Elephant, CSD methods alternatively take electrodes as a direct parameter. By nature of the API break in Neo, this also necessarily breaks API in Elephant.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0074a14bf638`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.