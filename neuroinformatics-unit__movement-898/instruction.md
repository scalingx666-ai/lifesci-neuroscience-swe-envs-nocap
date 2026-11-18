# Issue

**Title:** Enforce strict time alignment in load_multiview_dataset

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
Currently, multi-view loading assumes that all input datasets have perfectly aligned frame counts. In practice, this is often not the case, which can lead to silent introduction of `NaNs` due to `xarray.concat` alignment. This behavior is not explicitly communicated to the user.

**What does this PR do?**
Adds a note in the docstring of load_multiview_dataset clarifying the assumption of aligned frames and introduces a runtime warning when mismatched frame counts are detected across views.

## References

Discussion with maintainers on Zulip regarding handling of mismatched frame alignment

## How has this PR been tested?

Tested locally by creating datasets with different frame lengths and confirming that a UserWarning is raised

## Is this a breaking change?

No. This PR only adds a warning and documentation; it does not modify existing behavior.

## Does this PR require an update to the documentation?

Yes. The docstring of `load_multiview_dataset` has been updated to explicitly mention the frame alignment assumption and the warning behavior.

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a1ffa712972e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.