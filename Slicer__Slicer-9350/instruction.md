# Issue

**Title:** ENH: Add ShowInAllViewsByDefault option in vtkMRMLDisplayNode

## Description

This PR adds a `ShowInAllViewsByDefault` variable to `vtkMRMLDisplayNode` to clarify and control the behavior of `ViewNodeIDs`.

By default (`ShowInAllViewsByDefault = true`), an empty `ViewNodeIDs` list means that the display node is visible in **all view nodes**, preserving the existing behavior.

When `ShowInAllViewsByDefault = false`, an empty `ViewNodeIDs` list means that the display node is **not visible in any view node**.

This is useful when we need to keep track of the views in which a display node is actually shown, without relying on a combination of `ViewNodeIDs` and the visibility parameter. Currently, both "visible in all views" and "visible in no views" can result in an empty `ViewNodeIDs` list, making these two states ambiguous.

NOTE: in default `ViewNodeIDs` is an empty vector.

@lassoan

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fa84163204a5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.