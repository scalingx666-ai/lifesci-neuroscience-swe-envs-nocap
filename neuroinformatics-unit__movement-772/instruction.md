# Issue

**Title:** Add preliminary benchmarks

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
I was working on speeding up the bbox loading and wanted to check if/how much it was improved.

**What does this PR do?**
* It adds pytest-benchmark as a dev dependency
* It adds two benchmarks related to loading bbox data and marks them as "benchmark tests"
* It excludes the benchmark tests from pytest runs by default
* It adds guidelines on how to run benchmarks to CONTRIBUTING.md

Note that we don't check the values are correct in the benchmarks, since this is tested separately.

I also removed a variable called `expected_values_bboxes` and used its values directly for clarity. It was used only twice and its definition was far from its usage.

## References

PR #769 

## How has this PR been tested?
Benchmarks run correctly locally on my mac, but maybe it would be nice to test in other platforms if possible during review.

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

Included.

## Checklist:

- [x] The code has been tested locally
- [ n/a ] Tests have been added to cover all new functionality
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5ad4b72c9ff7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.