# Issue

**Title:** ENH: Color multi-component arrays by magnitude or a chosen component

## Description

A multi-component array, such as a vector array, is now colored by its magnitude by default, and users can choose one of its components instead.

Until now such an array was colored by its first component, which for a vector is the value along an arbitrary axis. The automatic scalar range and the default threshold range also used the first component.

## Changes

- The scalar range, the model threshold, and the mappers in 3D and slice views use the magnitude by default.
- `vtkMRMLDisplayNode::ActiveScalarComponent` chooses a component instead (-1, the default, is the magnitude). It is saved in the scene.
- `qMRMLScalarsDisplayWidget` offers the choice in a spin box when the array has more than one component.
- The mappers now get the component with `SetArrayComponent()`. VTK only uses the vector mode of a lookup table if the array component of the mapper is negative, and the mapper default is 0.

## Behavior change

Models that map a multi-component array through a color table, including those in existing scenes, now look different because they show the magnitude instead of the first component. To get a component back, select it in the new spin box. Direct color mapping of RGB arrays is not affected.

## Testing

- `vtkMRMLModelScalarComponentDisplayableManagerTest1` is new. It checks the colors that the mappers produce in 3D and slice views for the magnitude and for individual components.
- `vtkMRMLModelDisplayNodeTest1` now also checks the scalar range and threshold for the magnitude and for individual components.

These tests, `vtkMRMLModelDisplayableManagerTest` and `vtkMRMLModelSliceDisplayableManagerTest` pass in a Windows Release build, on a development branch where this commit sits on top of a few other small changes. This branch by itself, on top of `main`, has not been built locally.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b43f5f8d3da5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.