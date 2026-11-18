# Issue

**Title:** Remove `nan_policy` option in `compute_path_straightness`

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

. See issue for an explanation.

**What does this PR do?**

Removes the `nan_policy` option in `compute_path_straightness`. L (total path length) is now always computed via interpolation (which was the previous default behaviour).

There is no longer possibility to use the `"omit"` option.

## References

Bug introduced in #1042. I hadn't caught it in review.

## How has this PR been tested?

Existing tests in `test_kinematics/test_path.py` have been adapted accordingly. I got rid of a test that was now redundant, and added 1 new unit test.

## Is this a breaking change?

No. We hadn't yet released this (the bug was introduced after `v0.17.0`.

## Does this PR require an update to the documentation?

API docs update automatically. I've checked the local docs render.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4d2e9db58ec9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.