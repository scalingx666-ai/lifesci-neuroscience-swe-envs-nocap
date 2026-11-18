# Issue

**Title:** [ENH] Added ASSET class initialization parameter to define the binning rounding error tolerance

## Description

Currently, the `ASSET` class performs the binning of the spiketrains using the default behavior of the `BinnedSpikeTrain` class in `conversion`. 

Therefore, when spike times are closer to the right bin edge than a defined tolerance value, the `BinnedSpikeTrain` class shifts the spike to the next bin. This behavior can be controlled by the `tolerance` parameter of `BinnedSpikeTrain`.

This PR adds the new parameter `bin_tolerance` to the `ASSET` class, in order to allow the user to define the desired tolerance (and hence `BinnedSpikeTrain` behavior).

The parameter can take a string `'default'` to use the default behavior of `BinnedSpikeTrain` (and which corresponds to the current status of `ASSET` before this PR), or a float value or None. In the latter two cases, these values are forwarded to the binning class, and will result in either shifting or not shifting the spikes, respectively.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2bd871aec145`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.