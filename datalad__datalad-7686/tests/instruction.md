# Issue

**Title:** Add 3.13 testing/support

## Description

Debian has 3.13 already and my attempt to build 1.1.4 for Debian has failed. Hence had to look.

Changes of `CapturedException` as minimal and likely do not capture prior difference in use of `.__str__` vs `.__qualname__`. But I do not think there is anything we could do about that now that there is no `exc_type` stored. May be @bpoldrack would find a moment to have a look. 

Meanwhile I will run this version of the patch into debian package.

TODO
- [x] test_ProducerConsumer (interestingly -- always fails but differently and never seems to succeed "by chance")

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `48da71f37fe5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.