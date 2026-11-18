# Issue

**Title:** Separate napari image parameter to prevent magicgui slowdown

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

The problem is that when large images are open in napari, every time I try to edit a parameter (and I imagine - when the progress bar is updated), the gui freezes for a bit. After some testing I realized that every time *any* parameter updates, magicgui is processing something for all the parameters in the root widget. But, this processing takes particularly long for image parameters, especially for large images (maybe magicgui gets some image data?).

You can see this effect in the video where I change the num threads without and with images being open.

main branch with no images open:

https://github.com/brainglobe/cellfinder/assets/1644286/f93a3063-9f19-4f91-b5f7-b2979dcf2ad3

main branch with an image open. You can see the lag:

https://github.com/brainglobe/cellfinder/assets/1644286/22a306ed-f8c8-475e-84b3-41c3bba3d984

**What does this PR do?**

This PR breaks out the signal and background inputs to their own magicgui containers. This somehow prevents this processing, because they are in their own container within the root parameter container, rather than directly in the root container. No idea why as I'm not familiar with qt/magicgui.

You can see the fix with this branch:

https://github.com/brainglobe/cellfinder/assets/1644286/e423ed8e-1d89-48f0-9d4c-a6e0ca5adaa0

## References

None.

## How has this PR been tested?

Tested by running the gui and the pipeline.

## Is this a breaking change?

No

## Does this PR require an update to the documentation?

No.

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `daa13e2f46f8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.