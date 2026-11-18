# Issue

**Title:** Increase atlas name validation stringency

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
To validate/enforce stricter naming convention. 

**What does this PR do?**
`validate_atlas_name` checks the following constraints.

Atlas name
- Can contain: lowercase letters, digits, underscores, hyphens, periods
- Ends with resolution (e.g., 5um, 37.5um, 1mm)
- Resolution: number + um (micrometers) or mm (millimeters) or nm (nanometers)

Note: In theory `atlasapi` can now deal with atlasses that have `nm`, `um`, and `mm` resolutions. In practice however, `um` is still assumed during the atlas generation so only `um` atlasses can be generated. 

## References
#524

## How has this PR been tested?
`test_validate_atlas_name` covers:

- **Upper Case Letters**: Names must not contain capital letters. Example: `"CONTAINS_CAPITALS_1um"` should fail.
- **Invalid Characters**: Names must only contain lowercase letters, digits, underscores, hyphens, and periods. Example: `"contains_inv@lid_character_1um"` should fail.
- **Resolution Format**: Names must end with a valid resolution (e.g., `5um`, `1.5mm`). Examples: `"10um_atlas_name_does_not_end_with_resolution"` and `"atlas_name_with_invalid_resolution_100m"` should fail.
- **Valid Names**: Names that meet all criteria should pass. Examples: `"valid_name_100um"` and `"valid-name_1mm"` should pass.

## Is this a breaking change?
No.

## Does this PR require an update to the documentation?
No.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `02a9a451e154`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.