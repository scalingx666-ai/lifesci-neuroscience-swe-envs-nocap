# Issue

**Title:** `brainglobe-atlasapi` V3 compatibility

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
 

**What does this PR do?**
Change the way available atlases are fetched for the dropdown to use `get_all_atlases_last_versions()`.
Sets `aiobotocore` and `botocore` debugging level to INFO.
Ensures the `example_mouse_100um` is used for testing.

## References
 

## How has this PR been tested?
Tested locally with `brainglobe-atlasapi==3.0.0rc1` and `brainglobe-atlasapi==2.3.1`. All tests pass.

## Is this a breaking change?
No

## Does this PR require an update to the documentation?
No

## Checklist:

- [x] The code has been tested locally
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2d405316d0c5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.