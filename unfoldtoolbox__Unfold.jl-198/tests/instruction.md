# Issue

**Title:** emptyeffects

## Description

- improved designmatrix due to interpolate=false, speedup 3x
- up to 10x faster designmat for FIR designs
- fix unittests?
- double speedup due to unnecessary copying in some cases
- fix bug where designmatrix was one too long
- undo a debug test
- fix integer splines
- fix timespline basis
- replaced similar with zeros as it should be
- added fix for missing outside bounds spl
- fix circspl
- fix #167

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c7ec1ec10b36`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.