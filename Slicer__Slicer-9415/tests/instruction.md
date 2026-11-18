# Issue

**Title:** ENH: Allow configuring touch gesture thresholds of slice intersection widget

## Description

Two-finger touch gestures in slice views only start to act once they have gone beyond a threshold (10 degrees of rotation, 25 pixels of translation, 10% of zoom), so that a pinch does not also slightly rotate and translate the slice. These thresholds were fixed.

This adds setters and getters to `vtkMRMLSliceIntersectionWidget` for the existing `TouchRotationThreshold`, `TouchTranslationThreshold` and `TouchZoomThreshold` members, so that applications can tune them. The defaults are unchanged.

Motivation: on a phone, the fingers turn a little with every pinch, and in-plane rotation of a slice is rarely what is meant. The web version of Slicer (SlicerWeb) raises the rotation threshold to 30 degrees so that zooming and panning with two fingers does not keep rotating the slice:

```cpp
sliceIntersectionWidget->SetTouchRotationThreshold(30.0);
```

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9a54dda46fdd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.