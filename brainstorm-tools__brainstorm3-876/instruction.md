# Issue

**Title:** Add option for FEM mesh generation (supporting non-nested surfaces with cases that intersect )

## Description

Introduces a new 'iso2mesh-2026' method for FEM mesh generation from triangulated surfaces, supporting non-nested surfaces with cases that can intersect with manual tissue identification. Update method selection, descriptions, and user dialogs to include and explain the new option.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `75f3c41acd91`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.