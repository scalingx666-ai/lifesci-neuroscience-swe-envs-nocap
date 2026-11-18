# Issue

**Title:** Add temporal spectral community detection

## Description

- Implement as discussed the spectral method for temporal community detection outlined in  [this paper ](https://arxiv.org/abs/2412.07378)(`teneto/communitydetection/spectral.py`). Document in `docs/teneto.communitydetection.rst`. 

- New dependency: `scikit-learn` (used for KMeans and clustering
  metrics) declared in `requirements.txt` and `setup.py`

 - Testing:  `pytest test/communitydetection/test_temporal_spectral.py`

- Other: switched from `m2r` to `myst_parser` for docs (the former breaks on newer Sphinx versions). Require `matplotlib >= 3.8` (also to make Sphinx happy)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3aa59a834964`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.