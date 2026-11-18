# Issue

**Title:** Remove modular asv benchmarks

## Description

keeping an eye on brainglobe/cellfinder#404 👀 


## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
To remove unused benchmarking code.


**What does this PR do?**
Deletes old code that used `asv` to benchmark individual functions of `cellfinder.core`. 

We decided to go for an integrated approach to benchmarking, in which we benchmark a full workflow rather than modules or individual functions. Because of this, we also moved all benchmarking code to [the workflows repository](https://github.com/brainglobe/brainglobe-workflows).

## References

The most relevant issues are brainglobe/brainglobe-workflows#105 and brainglobe/brainglobe-workflows#106, although since then the benchmarking work has moved to [the workflows repository](https://github.com/brainglobe/brainglobe-workflows).

## How has this PR been tested?

The code has been tested locally.

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

No.

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e6a887f1721b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.