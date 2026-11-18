# Issue

**Title:** Adding exceptions classes

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

## Description

Begin to implement custom exceptions as mentioned in brainglobe/brainreg#82. Started by a custom exception for failed file loading. Currently checks whether the user is trying to pass a directory containing a single .tiff (e.g. 3D .tiff), in which case gives a message to pass the path including filename. Otherwise, it will print the origional traceback with an additional line indicating the problem is with file loading.

Some points to discsuss:
- it could be worth pre-checking inputs and raising an error there, rather than wait to fail on file loading, although this might come with performance penality.
- In the traceback, all attempted image files could be loaded e.g. with PIL (require new dependency), to check their size - this way a tailored traceback can be given.
- A couple of functions in this class could be moved to a more general utils module
- it would be useful to have a config of accepted file extensions (e.g. .tif, .tiff)


**What is this PR**

- [ ] Bug fix
- [X ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
see issue brainglobe/brainreg#82

**What does this PR do?**
Implements custom exception class for load file errors

## References

Please reference any existing issues/PRs that relate to this PR.
brainglobe/brainreg#82

## How has this PR been tested?
pytest suite

Please explain how any new code has been tested, and how you have ensured that no existing functionality has changed.
pytest suite, and the new code is only called when file loading fails (i.e. when there is already an issue)

## Is this a breaking change?
No

If this PR breaks any existing functionality, please explain how and why.
NA

## Does this PR require an update to the documentation?
No

If any features have changed, or have been added. Please explain how the documentation has been updated (and link to the associated PR). See [here](https://docs.cellfinder.info/for-developers/documentation) for details.

## Checklist:

- [X ] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [X ] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `701fa7f6094b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.