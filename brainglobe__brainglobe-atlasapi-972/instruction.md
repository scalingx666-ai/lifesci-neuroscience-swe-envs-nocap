# Issue

**Title:** Remove unused format_*_stub descriptors

## Description

Replace the whole box with this:

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other (removing dead code)

**Why is this PR needed?**

`format_template_stub`, `format_annotation_stub` and `format_terminology_stub` in `descriptors.py` are never called. The nested metadata is built by `ComponentInfo` in `atlas_packaging_data.py` instead. Confirmed as dead code in #782.

**What does this PR do?**

Removes the three functions and the tests that only covered them. `format_component_stub`, `format_hemispheres_stub` and `format_meshes_stub` are unchanged, since they're still used.

## References

Follows up on #782.

## How has this PR been tested?

Grepped the whole repo (package, tests, `atlas_scripts/`, tutorials, docs) for the three names, including dynamic lookups via `getattr` or `__all__`. The only hits were their own definitions and tests.

Full suite passes locally: 333 passed, 5 xfailed. Pre-commit passes.

## Is this a breaking change?

Technically yes. These were public functions, so any external code importing them would break. Nothing inside this repo uses them.

## Does this PR require an update to the documentation?

No.

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration). Not applicable, this only removes code.
- [ ] The documentation has been updated to reflect any changes. Not applicable.
- [x] The code has been formatted with [[pre-commit](https://pre-commit.com/)](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b904a1cce82f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.