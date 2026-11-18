# Issue

**Title:** Fetch atlas meshes by loading meshio and converting to vedo mesh

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
Following the release of `brainglobe-atlasapi==3.0.0rc0` meshes are no longer stored on disk as .obj files. `brainrender` accesses these files directly to load meshes into `vedo`.

**What does this PR do?**
Alters the loading path for atlas meshes. `brainrender` now requests the mesh directly from `brainglobe-atlasapi` receiving a `meshio.Mesh`, this is converted into a `vedo.Mesh` and passed through as before.

## References
#460 

## How has this PR been tested?
All tests pass locally and local examples involving atlas meshes have been inspected in an environment with `brainglobe-atlasapi==3.0.0rc0` and `brainglobe-atlasapi==2.3.1`

## Is this a breaking change?
No, this change is backwards compatible with `brainglobe-atlasapi<3.0.0`

## Does this PR require an update to the documentation?
No

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e1b196933899`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.