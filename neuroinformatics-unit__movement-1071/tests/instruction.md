# Issue

**Title:** Run benchmark tests on CI without benchmarking

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
 
Supersedes #854 
Follow-up PR to migrate to tox TOML: #1073 

**What does this PR do?**
This PR 
- run the full test suite, including benchmark tests on CI (via tox config in pyproject.toml) with the [--benchmark-disable](https://pytest-benchmark.readthedocs.io/en/latest/usage.html#commandline-options:~:text=that%20contain%20benchmarks.-,%2D%2Dbenchmark%2Ddisable,-Disable%20benchmarks.%20Benchmarked) flag: this is equivalent to a smoke test, running the benchmark tests once without benchmarking. 
- fixes the broken benchmark test that still uses the old `_df_from_valid_via_object` function, replacing it with `_numpy_arrays_from_valid_via_object` introduced in #769 

## How has this PR been tested?
ran `pytest -m benchmark --benchmark-disable` locally and on CI ([as a separate step](https://github.com/neuroinformatics-unit/movement/actions/runs/31510355427/job/93842526810?pr=1071#step:4:2230)) to verify benchmark tests pass in seconds.

## Does this PR require an update to the documentation?
the relevant section in the contributing guide has been updated.

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3b42f91e199d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.