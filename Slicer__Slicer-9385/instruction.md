# Issue

**Title:** PERF: Avoid re-clipping models when nothing has changed

## Description

Clipping a large mesh takes seconds, and it was redone on almost every render whenever a model was clipped. This PR makes the clip node and the model displayable manager keep their clip functions and clippers between updates, so the mesh is only clipped again when something actually changed.

- `vtkMRMLClipNode::UpdateImplicitFunction` rebuilt its implicit boolean on every modified event of its clipping nodes, marking it modified even when no clipping node had moved. It now builds the new function list separately and only replaces the current list if it differs.
- `vtkMRMLModelDisplayableManager::UpdateModelMesh` created a new `vtkImplicitBoolean` and set a new transform on it on every update. The clip function is now kept per display node and only modified when the clip node's function or the model's transform has actually changed. The mapper of a clipped model stays connected to the existing clipper instead of being rebuilt on every update under a transform.
- `RemoveModelProps` removed the props of every clipped model on every scene update, discarding the clipper and its clipped mesh. It now only removes props when the model's clipping state has changed.
- `GetClipper` now turns boundary cell extraction off again when the clipping method changes, since the extract filter is reused.

A separate commit fixes the `clippingMethod` XML attribute name in `ReadXMLAttributes`, which did not match the name written by `WriteXML`, so the clipping method was lost when a scene was loaded.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `147e764b580b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.