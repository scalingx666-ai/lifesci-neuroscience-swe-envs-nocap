# Issue

**Title:** Don't deepcopy input arrays to prevent loading into RAM

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

I noticed while using napari to classify points from a large tiff that had been memmapped, that the tiff would be loaded fully into memory at some point. I traced it down to `asdict` doing a `deepcopy` of all the field values of the data class. Or rather it only does it for non basic object types.

This means that all the data layers inputs get deep copied, even if they are memmaped so that it loads the full data into memory. Which is not wanted.

**What does this PR do?**

With this PR, we use our own version of `asdict` that converts the data class into a dict without doing the `deepcopy`.

## References

Please reference any existing issues/PRs that relate to this PR.

## How has this PR been tested?

I manually tested it in napari and also added a test function.

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

No.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)


I think it would be a good idea to add an end-to-end test with a large tiff that is opened via memmap (or dask, although I'm not sure deep copying a dask array would load the data into memory) and check that it isn't loaded into memory. But I'm not sure how to do this in a automatic test without creating large files on disk. Otherwise if it's a small test tiff it'd be hard to know if the file is loaded into memory.

Perhaps that needs to stay as manual test?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0888c9eaff7e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.