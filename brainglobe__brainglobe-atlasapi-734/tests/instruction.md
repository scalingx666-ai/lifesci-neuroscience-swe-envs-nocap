# Issue

**Title:** feat: add validation for duplicate structure acronyms

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**



Duplicate structure acronyms are incompatible with the current implementation of ``brainglobe-atlasapi`` as acronyms are used as primary keys to fetch region details. This validation catches such issues during atlas generation.

**What does this PR do?**

Adds a [validate_unique_acronyms](cci:1://file:///c:/Users/swapn/code/brainglobe/brainglobe-atlasapi/brainglobe_atlasapi/atlas_generation/validate_atlases.py:426:0-458:15) function that checks for duplicate acronyms in atlas structures during validation and raises an `AssertionError` with a meaningful error message listing the duplicate acronyms.

## References

- Issue #666

## How has this PR been tested?

- Added ``test_validate_unique_acronyms_fail`` test that mocks atlas structures with duplicate acronyms and verifies the validation fails with the expected error message
- The existing ``test_valid_atlas_passes_all_validations`` test will automatically verify the function passes on valid atlases

## Is this a breaking change?

No!

## Does this PR require an update to the documentation?

No, this is an internal validation function used during atlas generation.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5508e5525af6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.