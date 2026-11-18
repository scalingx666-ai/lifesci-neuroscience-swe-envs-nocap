# Issue

**Title:** Import header from brainglobe-utils

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [X] Other

**Why is this PR needed?**
Currently, the `brainreg` widget has no header (i.e. no brainglobe logo / documentation links...).

**What does this PR do?**
This PR adds a header from `brainglobe-utils`. As this increases the length of an already long widget, a vertical scrollbar is also added to make navigation easier. This uses the same `QScrollArea` solution as the `cellfinder` [detect](https://github.com/brainglobe/cellfinder/blob/main/cellfinder/napari/detect/detect.py#L229) and [train](https://github.com/brainglobe/cellfinder/blob/main/cellfinder/napari/train/train.py#L180) widgets. These scrollbars aren't ideal as they require using internal (marked with `_`) values from the `magicgui` widget. A better solution would be to change all widgets to use `qtpy` directly, but this isn't a very quick fix.
![Screenshot 2024-04-15 113356](https://github.com/brainglobe/brainreg/assets/24316371/49e38f42-2c51-45b3-879a-61d833eb8ce2)

## References

For 

## How has this PR been tested?

All tests pass locally.

## Is this a breaking change?

No

## Does this PR require an update to the documentation?

No

## Checklist:

- [X] The code has been tested locally
- [X] Tests have been added to cover all new functionality (unit & integration)
- [X] The documentation has been updated to reflect any changes
- [X] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8aa73e537e2b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.