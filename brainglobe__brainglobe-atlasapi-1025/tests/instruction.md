# Issue

**Title:** Unify closing_n_iters for all meshes and add temporary padding before closing holes

## Description

## Description
Change the value of `closing_n_iters` for the root mesh in `mesh_utils.py` such that it uses the same value as the rest of the meshes, and stops mesh clipping when `closing_n_iters` is high. 
 

**What is this PR**

- [X] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
For certain atlases where the atlas is too close to the borders of the atlas space, the hardcoded value of `closing_n_iters=8` leads to clipping of the root mesh. 

**What does this PR do?**
Unifies the value of `closing_n_iters` such that all meshes are generated in the same way. 
Adds temporary padding before the hole closing step to ensure no meshes get clipped even when `closing_n_iters` is high. 

## References
Issue #1024 
Related to #1003 

## How has this PR been tested?
This has been tested locally on `lambada_dev_mouse_p3_25um` to check that the root mesh no longer clips, as seen below (`closing_n_iters = 20`): 
<img width="683" height="513" alt="image" src="https://github.com/user-attachments/assets/da115fc3-b6ab-4f5a-b48b-73d46cc7c29d" />


## Is this a breaking change?
A big caveat to this is the fact that the original intent of hardcoding `closing_n_iters=8` was to ensure that the root mesh is nice and closed during mesh generation. It is possible that using the packager-defined value may result in holey root meshes. 

## Does this PR require an update to the documentation?
No, but it may be useful to create a validation function to ensure that no atlases packaged so far have clipped root meshes. 

## Checklist:

- [X] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [ ] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f9faca8bb31f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.