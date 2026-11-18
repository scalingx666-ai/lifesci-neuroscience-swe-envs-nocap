# Issue

**Title:** ENH: Add ColorLegendDisplayNode support to vtkMRMLFiberBundleDisplayNode

## Description

Control of the color legend is the same as in the "Models" and "Volumes" modules. Each tab in "Advanced Display" subsection has it's own "Color Legend" parameters.

One can create and control a color legend if both FiberBundleNode and corresponding FiberBundleDisplayNode (for Line, Tube, Glyph) are valid.

Visibility of primary display node controls visibility of color legend as well.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9a9a11cc29e8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.