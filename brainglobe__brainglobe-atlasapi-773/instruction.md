# Issue

**Title:** Fix crash on empty custom_atlases.conf

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
- If the `custom_atlases.conf` file exists but is completely empty, the `brainglobe list` CLI crashes with a `KeyError`.
- A previous attempt to fix this (#681) used `.get("atlases", {})`. But since `utils.conf_from_file()` returns a `ConfigParser` object and not a dict, that just raises a `TypeError` (missing the 'option' argument).

**What does this PR do?**
- Safely falls back to the official atlases by catching the native `KeyError` that is thrown when parsing an empty file's `["atlases"]` section, right alongside the existing `FileNotFoundError`.

## References

-  

## How has this PR been tested?

- Added `test_get_all_atlases_lastversions_empty_custom_atlases` in `test_list_atlases.py`
- Creates an empty configuration file using the `mock_brainglobe_user_folders` fixture to prove the cli no longer crashes.

## Is this a breaking change?

No

## Does this PR require an update to the documentation?

No

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fe93c051b5f5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.