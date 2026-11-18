# Issue

**Title:** Hetamap visualization

## Description

Added code to create heatmaps visualizations.

The idea is that, starting from a dictionary that maps `region names` -> `scalar values` brainrender adds all the regions to a `Scene`, colors them according to the scalar value and a colormap and then visualizes things. This way the regions colors are a `heatmap`.

For the visualization, the `Scene` is 'sliced' with two `Plane` objects to create an almost 2D visual feel (though of course the whole thing is rendered in 3D with `vedo`). The use can select different orientations ('frontal', 'top', 'sagittal') which specifies the orientation of the planes slicing the scene and of the camera, and specify the position of the 'slice' (along an axis that depends on the orientation) and the thickness of the slice (distance between planes).

![image](https://user-images.githubusercontent.com/17436313/148071736-76ea85c5-5c7d-421f-abbd-7bae99c948fe.png)

![image](https://user-images.githubusercontent.com/17436313/148071838-b696dc13-0e7f-4170-bbc7-4617622b8c88.png)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b414cebfc19a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.