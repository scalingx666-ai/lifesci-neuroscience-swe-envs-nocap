# Issue

**Title:** Update and add missing docstrings

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
This PR 
- updates and adds missing class attribute docstrings in adherence to [PEP257 docstring conventions](https://peps.python.org/pep-0257/) for "attribute docstrings". This allows us to use type annotations in the docs. See also [sphinx autodoc's guide](https://www.sphinx-doc.org/en/master/usage/extensions/autodoc.html#doc-comments-and-docstrings) on documenting module data members or class attributes. 
- replaces the removed `autodoc_default_flags` with [`autodoc_default_options`](https://github.com/sphinx-doc/sphinx/blob/cc7c6f435ad37bb12264f8118c8461b230e6830c/doc/extdev/deprecated.rst?plain=1#L1487-L1490)
- replaces `Callable` return type with `collections.abc.Callable`
- fixes broken ref to `compute_signed_angle_2d()` in [compute_allocentric_angle_to_nearest_point](https://movement.neuroinformatics.dev/latest/api/movement.roi.BaseRegionOfInterest.html#movement.roi.BaseRegionOfInterest.compute_allocentric_angle_to_nearest_point)

## References
#727 
There isn't currently a ruff rule to ensure public class attributes are documented, but this is an  pending decision. 

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a0a858356aaf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.