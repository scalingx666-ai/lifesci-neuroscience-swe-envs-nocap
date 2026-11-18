# Issue

**Title:** Fix import of NIDM-Results pack with F-tests

## Description

This PR fixes an issue identified by @AlexBowring.

**Description of the problem**: When uploading a NIDM-Results pack containing an F-test but no T-test (e.g. [this one](https://drive.google.com/file/d/0B5rWMFQteK5edHlaZUM1TTVIbzg/view?usp=sharing)), the upload fails and NeuroVault returns "Invalid NIDM-Results file".

**Fix**: When loading the statistic maps available in a NIDM-Results pack, NeuroVault is looking for contrast maps to retrieve the corresponding contrast name. But contrast maps are only defined for T-tests (cf. [Contrast estimation in NIDM-Results](http://nidm.nidash.org/specs/nidm-results_130.html#h-contrast-estimation)). This PR updates the query to get the contrast name directly from the statistic maps. This solves the issue (tested on 1 example only) and should insure that the correct contrast name is associated with each statistic map.

Please let us know what you think of this. Thanks!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4fc3d729f7e3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.