# Issue

**Title:** Fix `save_bboxes` import typos in docstring examples

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

The docstring examples in the [to_via_tracks_file](cci:1://file:///d:/Agentic_AI/Gssoc_NLU/movement/movement/io/save_bboxes.py:16:0-155:20) function incorrectly use `save_boxes` instead of the correct module name `save_bboxes`. This causes confusion for users following the documentation examples.

**What does this PR do?**

Fixes 5 incorrect import statements in the docstring examples:
- `from movement.io import save_boxes` → `from movement.io import save_bboxes`
- `save_boxes.to_via_tracks_file(...)` → `save_bboxes.to_via_tracks_file(...)`

## References



## How has this PR been tested?

- Verified that no occurrences of `save_boxes` remain in the file
- Pre-commit hooks passed (ruff, ruff format, mypy)
- This is a documentation-only change with no functional code modifications

## Is this a breaking change?

No. This PR only corrects typos in docstring examples.

## Does this PR require an update to the documentation?

No additional documentation updates required. This PR itself fixes the documentation.

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9811fa995c2b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.