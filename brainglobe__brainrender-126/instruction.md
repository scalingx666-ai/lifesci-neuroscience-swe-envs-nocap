# Issue

**Title:** Fix tests (sort of)

## Description

Hi @FedeClaudi,

I think the tests are broadly ok, the only things failing were:
* `morphapi` requiring `brainio` (see )
* `tests/test_scene/test_add_from_files` was failing as `tests/files/CC_134_1_ch1inj.obj` can't be found. I've allowed this to fail for now, but the file needs adding back at some point.

This last commit will fail (unless an updated version of `morphapi` is released), but previous builds were successful (I temporarily added `brainio` as a dependency), see [here](https://travis-ci.com/github/brainglobe/brainrender/builds/195698525).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ca911709266d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.