# Issue

**Title:** Add minimum distance setting for ECP module to avoid divided by zero error and electrodes being too close to neurons

## Description

I made a pull request on the same issue a year ago but it was not merged. I made this new request since there have been some other related updates over the year. I hope this one will be considered. The issue and update is described as follows.

When recording using ECP module, there is no restriction between the electrode position and the cell position. There could be "divided by 0" error when an electrode is right on the center axis of a segment. A more likely scenario is that when they are very close there could be unexpected large deviation in the ecp. The solution is to set a minimum distance limit, say 'rm', between the electrodes and cells.

ECP calculation uses line source approximation. In the calculation of transfer resistance, the parallel and perpendicular components of the electrode position with respect to the line source (center line of a segment) are obtained first. Then check whether the parallel component is at most rm away from the line segment. If so, check whether the perpendicular component is smaller than rm and if so, set it to rm. The geometry interpretation is that the distance between the electrode the line source will be at least rm. More specifically, there is a prohibited volume which is a cylinder of radius rm and height (segment length + 2 * rm) with axis along the segment center line. If an electrode enters this volume, setting the distance limit is equivalent to pushing it to the nearest point on the lateral surface of the cylinder.

A parameter 'minimum_distance' was added to the module EcpMod. It can be specified in the simulation config file. There are two modes for determining the distance limit, fixed and automatic. If 'minimum_distance' is a number, a fixed rm (in micron) will be used for all segments in the calculation. If 'minimum_distance' is 'auto', rm is set to the radius of each segment. To allow this calculation, a property 'd' was added to _LazySegmentCoords in the morphology module (TODO: Only keep track of segment diameter when automatic mode is used to slightly improve performance. Please feel free to decide). If 'minimum_distance' is not specified or if its boolean value is False, then minimum distance limit won't apply, which is the default behavior.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a030ae966c82`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.