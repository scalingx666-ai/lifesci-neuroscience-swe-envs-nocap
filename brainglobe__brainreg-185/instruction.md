# Issue

**Title:** allow for additional channels with same name

## Description

## Description

**What is this PR**

- [x] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
Folders/files containing additional channels to register currently can't have the same name.
Registered additional channels get overwritten.

**What does this PR do?**
Allows users to pass additional channel folder/file with the same name.
The files that will be written will be the first unique set of names going up the levels of the file tree.
This means that the current behaviour is preserved for unique sets of additional channel names.

This PRs also adds tests for this, and sensible error raising if you pass the same additional channel multiple times.
This PR also adds a docstring to the `prep_registration` function.

## References

 

## How has this PR been tested?

New tests added.
Manual checking on real life data shows that for two additional channel tiff files with same names but in different folders (`025_micron/same_file_name.tif` and `025_micron_dummy/same_file_name.tif`, the files are named after the folders:
![image](https://github.com/brainglobe/brainreg/assets/10500965/206c41a6-f9a4-4655-9092-d2cd979641fb)

## Is this a breaking change?

No

## Does this PR require an update to the documentation?

Docstring added/updated.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `65388d0f2690`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.