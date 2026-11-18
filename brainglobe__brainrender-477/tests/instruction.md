# Issue

**Title:** Remove keybinds that didn't work, rebind screenshot

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
CI was having errors due to garbage collection of Scene objects. They were being kept alive by a circular reference between Scene and Plotter. The culprit can be seen below, this didn't have any effect but kept a reference hanging around preventing collection.

https://github.com/brainglobe/brainrender/blob/05193561152682b324144e73c2fb36ae74d0bcbf/brainrender/render.py#L55

**What does this PR do?**
Removes the previous machinery for adding key bindings that had no effect (tested by trying to use `s` for screenshot in a scene, only `Shift+s` worked for the vedo screenshot). Added the screenshot key bind back using a weak ref this time to prevent the same loop.

Now:
`q` quits as before
`s` calls the `brainrender.Scene.screenshot` method
`Shift + c` prints the camera information (previously this was stated to be `c` but that wasn't actually bound, this was perhaps the old `vedo` key bind that was relied on implicitly)

## How has this PR been tested?
Tested locally, the new screenshot key bind works.

## Is this a breaking change?
No

## Does this PR require an update to the documentation?
We should make sure the key bindings are documented somewhere.

## Checklist:

- [x] The code has been tested locally
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `051935611526`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.