# Issue

**Title:** Remove deprecated funcs and document deprecation lifecycle

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other: maintenance and docs

**Why is this PR needed?**

We have several deprecated functions for a while now:

- `compute_displacement`: deprecated since `0.9.1`!
- `load_poses.from_file`, `load_bboxes.from_file`, and `load_poses.from_multiview_files`: deprecated since `0.14.0`

**What does this PR do?**

- Removes the deprecated functions and associated tests
- Leaves a skeleton structure in `test_deprecations.py` to accommodate future deprecations
- Documents the deprecation lifecycle in the contributing guide

## References

 

## How has this PR been tested?

Tests pass locally.
Docs have been built and inspected locally.

## Is this a breaking change?

Yes, the deprecated functions will no longer be accessible.

## Does this PR require an update to the documentation?

Yes, included.

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `171bd9a076a8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.