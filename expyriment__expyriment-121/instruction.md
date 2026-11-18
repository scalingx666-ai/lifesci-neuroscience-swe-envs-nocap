# Issue

**Title:** adapted all methods to use correct coordinate system

## Description

The following methods have been adapted:
- io.screen.update_stimuli
- stimuli._visual.present
- stimuli._visual.plot
- stimuli._visual.inside_stimulus
- stimuli._visual.overlapping_with_stimulus
- stimuli._visual.overlapping_with_position

Furthermore, there was a bug in OpenGL textures. Positions on screen were a pixel off with OpenGL enabled, compared to running without OpenGL! This should now be fixed. I additionally added a hack to have surfaces with only one pixel in either dimension converted correctly into an OpenGL texture.

**Please test!**

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f6194eb0b817`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.