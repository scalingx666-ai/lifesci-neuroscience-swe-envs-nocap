# Issue

**Title:** Increase atlasgen mesh_utils coverage

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
Increasing test coverage and remove unused functions

**What does this PR do?**
Adds tests for `atlasgen/mesh_utils.py`

removes unused functions:
- `compare_mesh_and_volume`  (only once found, commented out, in [bg_atlasgen/atlas_scripts/humanatlas.py](https://github.com/brainglobe/bg-atlasgen/blob/76a513a1a6c53d59854ea2c6ba7ae7e04c0b364b/bg_atlasgen/atlas_scripts/humanatlas.py#L331))
- `region_mask_from_annotation`

## References
#503 

## How has this PR been tested?


## Is this a breaking change?
No.

## Does this PR require an update to the documentation?
Docstrings have been added to all tests.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)
- [x] Remove xfail markers after merging #557

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d6a6d7583656`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.