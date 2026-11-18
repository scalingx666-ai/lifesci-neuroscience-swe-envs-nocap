# Issue

**Title:** Move compute_turning_angle from orientation to path

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
`compute_turning_angle` is a path-level metric — it operates on trajectory data and quantifies movement complexity, not orientation. It belongs alongside `compute_path_length` and `compute_path_straightness` in `path.py`.

**What does this PR do?**
Moves `compute_turning_angle` from `movement/kinematics/orientation.py` to `movement/kinematics/path.py` and updates `__init__.py` to reflect the new location. Removes unused imports (`compute_backward_displacement`, `compute_norm`) from `orientation.py` that were only used by this function.

## How has this PR been tested?
Pre-commit checks pass on all modified files. No logic has changed — this is a pure relocation.

## Is this a breaking change?
No — `compute_turning_angle` remains importable from `movement.kinematics` as before.

## Does this PR require an update to the documentation?
No logic changes, but any docs referencing `movement.kinematics.orientation.compute_turning_angle` directly would need updating.

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ad11a59da161`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.