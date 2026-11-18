# Issue

**Title:** Fix cellfinder train CLI + CLI smoke tests

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**What does this PR do?**

- fixes bug found in https://github.com/conda-forge/cellfinder-feedstock/actions/runs/26215976079/job/77138310276#step:3:2059
- ensures we catch similar bugs earlier next time, by adding a smoketest for all CLI --help options


Tested manually that new tests fail on current main, for `cellfinder_train` with the same error as on the linked `conda-forge` CI, and that the error message gets printed on failure.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e127361a074c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.