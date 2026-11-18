# Issue

**Title:** Return NaN for isolation distance when the unit's spikes outnumber the other units' combined spikes

## Description

According to [Schmitzer-Torbert et al. (2005)](https://pubmed.ncbi.nlm.nih.gov/15680687/) and the [FMAToolbox](https://fmatoolbox.sourceforge.net), for a unit with N spikes, which has K comparison clusters, and their total combined number of spikes ("noise spikes") is M:
- If N <= M, isolation distance is the squared Mahalanobis distance of the N-th closest spike from other clusters.
- If N > M, there is no N-th spike from the other clusters' M spikes. "Isolation Distance is not defined for cases in which the number of cluster spikes is greater than the number of noise spikes."

`mahalanobis_metrics` was using `n = min(own, other)` instead. So in the N > M case, it returned the D² of the farthest spike of the other units, even if there were very few of these. As N >> M, this makes it look like the unit is really well isolated, when in fact there is no basis for that. We should return `NaN` instead.

(I've never used Bombcell, but someone in my lab does, so I checked: Bombcell treats a `NaN` `isolation_distance` as not computed, so this change doesn't make any unit fail).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7be675c89d9e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.