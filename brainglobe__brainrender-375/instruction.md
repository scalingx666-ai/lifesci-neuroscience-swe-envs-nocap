# Issue

**Title:** Update hemisphere slicing

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
See the discussion in 

**What does this PR do?**
If the atlas is marked as symmetrical in the metadata the midpoint is now calculated by taking the mean of the root mesh bounds for each axis. If the atlas isn't marked as symmetrical the previous behaviour is maintained.

## References


## How has this PR been tested?
Tested locally by visual inspection.
For an asymmetric atlas:
```
scene = Scene(atlas_name="mpin_zfish_1um")
scene.add_brain_region("hindbrain", hemisphere="right")
scene.add_brain_region("forebrain", hemisphere="left")
scene.render()
```

For symmetric atlases:
```
scene = Scene(atlas_name="allen_cord_20um")
scene.add_brain_region("WM", hemisphere="left")
scene.render()
```

```
scene = Scene(atlas_name="allen_mouse_25um")
scene.add_brain_region("CTX", hemisphere="left")
scene.render()
```

## Is this a breaking change?
No

## Checklist:

- [x] The code has been tested locally
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9cd07c8ad33f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.