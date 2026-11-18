# Issue

**Title:** Add `get_supported_source_software()` to expose supported formats

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

.

**What does this PR do?**

Adds `get_supported_source_software()` to expose the supported `source_software_values` and their corresponding file suffixes.

This allows downstream packages to programmatically discover which source software formats `movement` supports, along with their file suffixes, without hard-coding the list.

## References

- .
- See also discussion on Zulip [#Movement > expose registries](https://neuroinformatics.zulipchat.com/#narrow/channel/406001-Movement/topic/expose.20registries/with/591783893)

## How has this PR been tested?

A unit test has been added to verify the returned structure, but not the exact values, to avoid having to update this test everytime we add a new format. 

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

API docs are updated automatically (I've  checked this). 

The new functions is also cross-referenced from the docstrings of `load_dataset` and `load_multiview_dataset`, and from the Input/Output user guide, for discoverability.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8f2a315c1bfa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.