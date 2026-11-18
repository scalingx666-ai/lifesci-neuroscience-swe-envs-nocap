# Issue

**Title:** Update type map caching

## Description

## Motivation

Fix issues related to type map caching:
* fix #2053
* fix #2048
* fix #2045

This PR saves the type map pickle file in the user cache directory instead of the pynwb installation location, adds a catch for access errors when writing the cache files, and adds an option to disable caching.

A couple of questions related to implementation:
1. `platformdirs` has a built-in versioning argument that creates distinct version folders in the cache directory. The current draft of this PR uses this approach to replace the version indicator file. A pro is that someone working with multiple versions of pynwb would have the appropriate typemap cached for each version. A con is multiple cache files would be saved, especially when developing (We might want to recommend developers use the environment variable to disable the cache in general). Any other considerations I'm missing or preference for which approach to use?
~~2.  I added a `reset_namespaces` function, since it is difficult to test type map caching because unpickleable extension namespaces are loaded as part of the test suite. This could partially address #1009, but may require some further testing to make sure everything is working as expected. I can move that to a separate PR if needed, I think it would just limit the tests here.~~

Edit: I think any changes to resetting/unloading namespaces would need further discussion and should be moved to a separate PR. I'll remove the tests that require these changes for now. 

TODO
- [x] try to replicate original errors in singularity/apptainer


## How to test the behavior?
```python
import pynwb
```

## Checklist

- [x] Did you update CHANGELOG.md with your changes?
- [x] Have you checked our [Contributing](https://github.com/NeurodataWithoutBorders/pynwb/blob/dev/docs/CONTRIBUTING.rst) document?
- [x] Have you ensured the PR clearly describes the problem and the solution?
- [x] Is your contribution compliant with our coding style? This can be checked running `ruff check . && codespell` from the source directory.
- [x] Have you checked to ensure that there aren't other open [Pull Requests](https://github.com/NeurodataWithoutBorders/pynwb/pulls) for the same change?
- [x] Have you included the relevant issue number using "Fix #XXX" notation where XXX is the issue number? By including "Fix #XXX" you allow GitHub to close issue #XXX when the PR is merged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2888ad0b5bb0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.