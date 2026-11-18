# Issue

**Title:** Hotfix: GitHub actions runners docs and test-conda, with scipy==1.8.1

## Description

~~This PR introduces an upper bound for scipy<1.8.1.~~

~~Currently github actions workflows docs and test-conda fail with scipy 1.8.1 due to broken conda dependencys.~~

See: https://github.com/NeuralEnsemble/elephant/actions/runs/2419883695

Scipy==1.8.1 requires libstdcxx-ng 12.1.0, which is not yet available from the default conda channel https://repo.anaconda.com/pkgs/.
Updating to  `libstdcxx-ng 12.1.0` from conda-forge fixes the Issue, no need for a Scipy version cap anymore.

Further changes:
- update GitHub actions checkout, cache v2-> v3
- add `CI.yml` to hashing function for cache, this causes every change in `CI.yml` to reset the cache

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0df45812b932`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.