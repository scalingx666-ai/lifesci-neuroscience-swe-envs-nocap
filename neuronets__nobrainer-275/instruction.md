# Issue

**Title:** remove trained models

## Description

Removing trained-models from the docker container, as a result also git-annex and datalad

Some notes on debugging:
- the tensorflow images are built using jammy (22.04)
- git-annex 10.2306 is available from neurodebian for jammy
- datalad get results in an error for one file from OSF (kwyk/bvwn_multi_prior/weights/variables.index) - the md5 object for that file does exist on osf.
- the same issue could exist in nobrainer zoo cli (i would suggest using mamba/conda for that image and installing datalad from conda-forge).
- the current trained-models repo is almost 1G, hence avoiding it can be beneficial.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ba7f7e464e29`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.