# Issue

**Title:** feat: add plot_vertexwise to allow users to plot directly on an arbitrary mesh

## Description

Add plot_vertexwise function to yabplot.plotting which accepts pyvista.PolyData directly and avoids ROI mapping. Otherwise, the function is the same as plot_cortical.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `524bca426a2b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.