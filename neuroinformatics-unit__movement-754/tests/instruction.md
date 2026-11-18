# Issue

**Title:** Upper pin SciPy < 1.17.0

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

.

I've confirmed that the issue was caused by the recent SciPy 1.17 releases.

Concretely, `pytest ./tests/test_integration/test_filtering.py` passes with `scipy=1.16.3` but fails with `scipy=1.17.0`.

**What does this PR do?**

- Temporarily upper-pins SciPy to < 1.17.0 (to unblock our own v0.13.0 release)
- Adds the SciPy version to the `movement info` output, for easier debugging

I will leave the issue open as a reminder to deal with it properly, and eventually remove the upper-pin.

## References

Related to #752

## How has this PR been tested?

All tests now pass locally.

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

No.

## Checklist:

- [x] The code has been tested locally
- ~[ ] Tests have been added to cover all new functionality~
- ~[ ] The documentation has been updated to reflect any changes~
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `887bd023947c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.