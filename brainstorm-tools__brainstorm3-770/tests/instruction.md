# Issue

**Title:** Fix IsoSurface threshold slider range

## Description

This PR fixes the issue below (point # 8 in PR )
> Slider in panel surface for thresholding CT is set only at panel creation (CreatePanel), thus it's hardcoded to 1 to 4500
> See code: https://github.com/brainstorm-tools/brainstorm3/blob/master/toolbox/gui/panel_surface.m#L113

Now the slider range is updated in real time based on the IsoSurface.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4af7da18fb0d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.