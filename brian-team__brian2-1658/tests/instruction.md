# Issue

**Title:** Avoid using Python version >=3.11.9 but <3.12 for tests

## Description

Doctest discovery is broken for wrapped C functions (e.g. from numpy). This is a regression that has been introduced with the last bugfix release of Python 3.11, and will probably not be fixed anymore in 3.11. I guess we could work around the problem in our test suite in some way, but for now we simply do not install an affected Python version during the tests. This will solve itself in April 2026 when we drop Python 3.11 support ;-)

See python/cpython#117692

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4f211d2f1261`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.