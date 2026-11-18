# Issue

**Title:** Refactor create_region_mesh to use keyword arguments

## Description

Make create_region_mesh accept normal keyword arguments instead of a tuple, and provide a wrapper function for multiprocessing compatibility. Add skip_structure_ids parameter to allow skipping mesh generation for specific structures. Also skip meshes with no points in wrapup.



## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**

create_region_mesh currently accepts tuples. These are then unpacked as args[0], ..., args[9]. You need to count tuple indices to understand what each one does. This also makes adding new arguments difficult. The reason it was the way it was was to be compatible with multiprocessing functions. 
**What does this PR do?**
Here we split the function into one which uses keyword arguments and a wrapper which still accepts a tuple. 

## References

#729 #727 

## How has this PR been tested?

Please explain how any new code has been tested, and how you have ensured that no existing functionality has changed.

## Is this a breaking change?

If this PR breaks any existing functionality, please explain how and why.

## Does this PR require an update to the documentation?

If any features have changed, or have been added. Please explain how the documentation has been updated (and link to the associated PR). See [here](https://brainglobe.info/community/developers/index.html#to-improve-the-documentation) for details.

## Checklist:

- [ ] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [ ] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7fd58012a268`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.