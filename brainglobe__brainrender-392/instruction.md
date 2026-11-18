# Issue

**Title:** Add function to mirror the mesh of an actor

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
Currently, there's no easy way to mirror actors.

**What does this PR do?**
Added a `mirror` method to the `Actor` class, allowing actors' meshes to be mirrored around a specified axis. The method supports both standard and anatomical axes and can utilize an atlas for anatomical space.

Introduced a new example script that demonstrates the use of the `mirror` method. The script creates a scene, adds original and mirrored neurons, meshes, and probes, and renders the scene.

## References
 

## How has this PR been tested?
Tested locally by visual inspection, added an example script to demonstrate usage.

## Is this a breaking change?
No

## Does this PR require an update to the documentation?
No.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `02ea8d7b6ae0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.