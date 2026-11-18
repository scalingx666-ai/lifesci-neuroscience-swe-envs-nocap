# Issue

**Title:** NF: refactor webgl lighting

## Description

Splits the lighting change out of #310 (which has been sitting since 2019 and no longer merges cleanly), and makes it opt-in.

## What it does

Rationalize the lighting system. Now lighting options are controlled through a new "lighting" submenu under the surface GUI. This menu contains three options: topleft_lighting, uniform_illumination (moved here), and specularity (moved here):
* `topleft_lighting` fades between two light setups: the standard VTK-inspired 3-light setup (at zero) and a single light from above and to the left of the camera (at one), following the [top-left lighting convention](https://en.wikipedia.org/wiki/Terrain_cartography#Shaded_relief) used for shaded-relief topographic maps. This makes sulci read as valleys and gyri as ridges, which is what makes bumpy flatmaps legible — see @alexhuth's before/after screenshots in #310. There is a switch for this in the config file, but it should probably be ignored and removed.
* `uniform_illumination` fades between the standard lighting model (at zero) and uniform emissive shading for the surface (at one).
* `specularity` smoothly adjusts the amount of specular reflection. There is a switch in the config that sets the default specularity to on or off.

Each of these controls will automatically change as the surface morphs into its flattened mode, depending on whether `bumpy_flatmap` is turned on or not.

If `bumpy_flatmap` is turned off:
* `topleft_lighting` will always stay off
* `uniform_illumination` will go to 1.0 as the surface flattens, and then back to 0.0 as it folds up again
* `specularity` will go to 0.0 as the surface flattens, then back to its default value (0 or 1) as it folds up

If `bumpy_flatmap` is turned on:
* `topleft_lighting` will go to 1.0 as the surface flattens (giving nice hillshading), and back to 0.0 as it folds up
* `uniform_illumination` will always stay at 0.0
* `specularity` will always stay at the default value

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c9456472b4b2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.